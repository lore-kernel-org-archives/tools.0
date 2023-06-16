Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE9DF62
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 09:22:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f8c65020dfso3949415e9.2
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686907372; x=1689499372;
        h=from:to:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D4v3mesBBujs/bmOT65a8DT6DvERBCNfIfiOJ6wLwTs=;
        b=zN8dw2Q6lc77kRWzwodnG27H2S/no/WqERpqJBLSnKaB4DlSr8PA8d2NQf9BzfoS6f
         U8Bypjnf0hx0bFwFLDHSqgQ6gM544yQVm0z77B3wkIdQ+agD8CXvme/QAKLdVaU5DuwQ
         CK/KDgMlyBcsZOhRPR7RXykZYUaIwMR9vjzVuOUD/1d7rgtLnHjz0qi8YHC9bUQ0fNWp
         mRW4hgXMRoBe2RfDJtwQNsPkzV2bZ4+anUwgObl4PTuqHlIHQyipWuSk30OBQLoGNsPL
         K2WRDj8j9lMYqX2mJiCb27/YY8xV+dFHasPjFT4ulHih+GK1MjFSlX4TYC8odPwND3gj
         eKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686907372; x=1689499372;
        h=from:to:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4v3mesBBujs/bmOT65a8DT6DvERBCNfIfiOJ6wLwTs=;
        b=G/s98GQpHKc4Hgm5J9OGTJXrvIuw+QhjJtTOc4g0RJV7lA3/QBe7mO4/n8aZTnS7F7
         HX7wftLJJ1UYv8+iP3uj4SbxIMkghrPFCqOtfWllybGIhl3N4I4BxFkt2t4My6WMtoU6
         khmPLT2Ui0C83QstX/dPfDi0ogy6VshvLVXqBkAOk0Ovpl0yy/yptSl9VFwuWVZU3NsE
         sR39pspGUBOdfhejclg5YIWRrpiX1ff8MjWLVbw9JyXbDKCthiA9w/lqpRBCnxBonjps
         XNgrj8jHDyF+TW0XE2aGDqWUn3ddcPMZ7jy4uvo9ofaXPK8YVXRx1BHOiUWDxYrwyHx3
         14Nw==
X-Gm-Message-State: AC+VfDz8gq8RJa+U53zk7UHW1Q6GDjwcLlYPm6OE4qDfvZVCccOA/tKh
	kEN32sNr55DHuOlCp53tNiR9zpmsvCRoCqOSyqU=
X-Google-Smtp-Source: ACHHUZ5jAB6B5SUUXScj57/BADR7nC9lCLswJWQIRkyMw0c0rT3uO+p+/PrfkeeWRU7fi7hhY0SYew==
X-Received: by 2002:a7b:cd11:0:b0:3f7:b6d9:46a0 with SMTP id f17-20020a7bcd11000000b003f7b6d946a0mr1237421wmj.30.1686907372384;
        Fri, 16 Jun 2023 02:22:52 -0700 (PDT)
Received: from localhost (i5C740DE0.versanet.de. [92.116.13.224])
        by smtp.gmail.com with ESMTPSA id x3-20020a1c7c03000000b003f7aad8c160sm1659726wmc.11.2023.06.16.02.22.51
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jun 2023 11:22:51 +0200
Message-Id: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
Subject: [BUG b4] encoding issues with single-patch series
To: <tools@linux.kernel.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0

Earlier, I sent a patch where I tried to CC Alex Benn=C3=A9e. The generated
mail included the header:

    Content-Transfer-Encoding: 7bit

the CC header got correctly escaped, but the mail body contained the CC
with UTF-8 encoding:

    Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>


The mail got dispatched without any complaints, but then was rejected by
linux-gpio with:

    <linux-gpio@vger.kernel.org>: host 23.128.96.18[23.128.96.18] said: 550=
 5.7.1
        Content-Policy reject msg: Wrong MIME labeling on 8-bit character t=
exts.
        BF:<H 5.99033e-10>; S229768AbjFPGtM (in reply to end of DATA comman=
d)

One can reproduce it with:

    git clone -b b4/msrv https://github.com/Ablu/libgpiod.git
    cd libgpiod
    b4 send -o /tmp/test/ --resend v1
    # The generated mail includes UTF-8 in the body,
    # but has a 7bit header

I did a quick hack to get it resent, but not sure if that is a proper
solution:

--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1581,6 +1581,9 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             else:
                 msg.add_header('Cc', b4.format_addrs(pcc))
=20
+        msg.set_charset('utf-8')
+        msg.replace_header('Content-Transfer-Encoding', '8bit')
+
         send_msgs.append(msg)
=20
     if endpoint:


The weird thing is that some past mails where I also CC'd him,
apparently were sent with the right encoding settings automatically [1]:

    Content-Type: text/plain; charset=3D"utf-8"
    Content-Transfer-Encoding: 8bit

[1] https://lore.kernel.org/linux-gpio/20230612-crates_io_publish-v1-0-7098=
8ee9a655@linaro.org/raw

It looks like it works for a series but not for a single patch?

- Erik
