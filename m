Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90253A40;
	Fri,  4 Nov 2022 05:00:11 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id b11so3572259pjp.2;
        Thu, 03 Nov 2022 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4Uta7E0bopNtTziy9sLQPn5Tv7IzgOAHeIzDy1KYM0=;
        b=bx9VwKlNLfswy/Tj1Ux7d3SDX+8TP7DHJsI/3d8WmxaANzzxZEwMxzOMYXGr8omm7u
         uUMyo9mipNLs7rzYqNddHzT0/nBDizCoB8HwMilAX03EuBTqtgRkhCwawx1vlOt/2HvC
         /2yZsElbe7UD1aqfLAiyPxFpJ1gcpYyf4MTK4xnuS8ykgFx9WJMW/vS8pL8mCW3xAzUW
         R3er7HqwH4+kqeB7yXokbvyZPfUX0N1Cfe8McQHOpXNzWDcVBIeNYa8gNDBc3/dLYeBt
         gGoO5ZI4iR7mxbOgoj/inYZSkCcwVTSaBIwHs754+CcX5eU+bnkwqnwOB6Ztoa1pNFBh
         Gysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Uta7E0bopNtTziy9sLQPn5Tv7IzgOAHeIzDy1KYM0=;
        b=5b10mavAWcow2GqDcYK05txYVMrDj8kJ7WC38VnP+b8sL6MItX44Kc+H79xBbY0SQ1
         UD43KghZZOUfaX0h404sfoEjJwz8QkMyv4mARqP2XYNC2dvpGszOfBLXS0LZPOQbUGaa
         IlgQtZfa6+9d03YQk04obMBBDQlkN4vrRiGf/KUcuuXmcQ5rzHm+yH23rLkQYrKypvNY
         vaUZyEJclwOFdajRL4Epn97rtxv0dbkPyQk0F5KKGRyJw+1cqL6izczVWHPAJHLHNwTv
         Gy9V/GpRxoPqaMjBPSqhDxOLqbBT+0Z1lot0nJq+PAXHnYioWLLiuL/gKl9Bhqh8WwRU
         EBLA==
X-Gm-Message-State: ACrzQf0S5fm2TNeYB+zCZ7CH6yR/HjeOQT+J2Om5OPZWOjV1RvEVrEI6
	qBOE/8ETjdp6xTtwO8BvbwhOBDE/mz4=
X-Google-Smtp-Source: AMsMyM7WuCIltJkKXetAAPk8OJ4ZDqHxEESqGMlk04Nb/GipsRAdobvukuy63N2F1zHQUy79nwy7Uw==
X-Received: by 2002:a17:902:e810:b0:186:e9ff:4ec2 with SMTP id u16-20020a170902e81000b00186e9ff4ec2mr32624689plg.26.1667538010848;
        Thu, 03 Nov 2022 22:00:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001869f2120a6sm1592027plg.108.2022.11.03.22.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 22:00:10 -0700 (PDT)
Date: Thu, 3 Nov 2022 22:00:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 prep and --manual-reroll
Message-ID: <Y2ScVwTlqH/zz36J@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Somehow "b4 send -o dir" followed by "git send-email ..." managed to
produce quoted-printable cover letter message (see
https://lore.kernel.org/all/20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com/)
and that confused "b4 prep --manual-reroll ..." as this produced a tag
that had "=0D" as line ends. I was able to work around it with the
patch below (not sure if this is right thing to do)...

Also, doing "b4 send --resend" with this series did produce double
signature on the cover letter, even though I see in the code it tries to
remove it.

Thanks.

-- 
Dmitry

diff --git a/b4/ez.py b/b4/ez.py
index 4fcc988..8fb39d2 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1350,7 +1350,7 @@ def get_sent_tagname(branch: str, tagprefix: str, revstr: Union[str, int]) -> Tu
 def reroll(mybranch: str, cover_msg: email.message.Message, tagprefix: str = SENT_TAG_PREFIX):
     # Prepare annotated tag body from the cover letter
     lsubject = b4.LoreSubject(cover_msg.get('subject'))
-    cbody = cover_msg.get_payload()
+    cbody = cover_msg.get_payload(decode=True).decode()
     # Remove signature
     chunks = cbody.rsplit('\n-- \n')
     if len(chunks) > 1:
