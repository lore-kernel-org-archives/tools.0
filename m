Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53632EA2
	for <tools@linux.kernel.org>; Wed, 28 Sep 2022 09:37:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t4so8138342wmj.5
        for <tools@linux.kernel.org>; Wed, 28 Sep 2022 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:subject:from:reply-to
         :content-language:to:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=zLEa7ykOu1dhwKz/VlCTt6kgKcDzwwFWI4MQ2gEUSdI=;
        b=tk9+GOnXjzCm1Yb38TugFq5lrNjOG/MGdQSBWNQcu9T30QUJfsY+jMJPZHCc4rZQqi
         YF5OEcKAg4DBPBiJdQtiC/gx3LayFeypebElPffeWD+Uy0Mij9WJj2Hd+jWbaDTIznsV
         YYDspZ+9kBe8zcd2RjOF+4WFtf5ML+F7YQdQJhntRyNiPBl4OJ+C1UKQKu6/LUOC9/1Y
         WjyB49BqIrAX1q8P/tyGQOqRaQB/n6iSzJa6JQTw5Joa9csZ2f9whqMgZMXRobo6hJlJ
         f11Oh6xH1iZtGVuIwdo1jpKKRr26ZED9WdmtiA5crij9+pHvoynskWbsroj5DmavOwSj
         fPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:reply-to
         :content-language:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zLEa7ykOu1dhwKz/VlCTt6kgKcDzwwFWI4MQ2gEUSdI=;
        b=6zFx3tUpUW0BZzQi7su0SxMCsbILRpGqyp7gCv/2Y31N6PIm9qu5S1SihsPH7zMavG
         9H3pKEqUnjnObiTQKZF2qFxgXScKwl88Wt3V0MmQUxRWcuagws+n94MKTs5Si5MvvTFl
         m6B7t/3zJ14ZU4BqepIis/PjbHJ5hmri7R47RVLd/H1Xsg8uoY1dj86R04vsSg4kLxTU
         jOSoNDymzHi4ijGUzRVz0pq85PzF03NQK5cTb6oTeSyxQvH79HRF/kz0AOBJld+ucGhF
         aOi645oYxxeKFIEEJ93gJc50ewUd6pPbPJZoOZUmtL+P6eKG3XxyEeMciYZray7x1Pc/
         jiXw==
X-Gm-Message-State: ACrzQf3sU185c5QPqgCaiQkBQ0YACNfmRcLOrmPsq441+TCpmcPTrLNV
	qYxp7Q+nUa9Y8Wlfio/9EP5zeHSEkvcJrttA
X-Google-Smtp-Source: AMsMyM7l2HLthMywKPd/4g4N0Hb8JYVJvUyqJlLz0mOkLgvSg9qSzt28vd/HmBvPA3Jeb31O8u7kDw==
X-Received: by 2002:a05:600c:198d:b0:3b4:a62c:a085 with SMTP id t13-20020a05600c198d00b003b4a62ca085mr5784228wmq.140.1664357866616;
        Wed, 28 Sep 2022 02:37:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d6a8e000000b002252ec781f7sm3964592wru.8.2022.09.28.02.37.45
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 02:37:45 -0700 (PDT)
Message-ID: <eb5d38af-ed64-38fd-2515-e489120cbb0b@linaro.org>
Date: Wed, 28 Sep 2022 11:37:45 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: tools@linux.kernel.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: b4 send crashes when sendemail from is missing
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi !

First, thanks for the b4 work !

I've finally tried the b4 prep/send feature and when doing the first send I got this crash:

$ b4 send --no-sign

Converted the branch to 7 patches

Populating To/Cc addresses

Will send the following messages:

---

To: <snip>

Cc: <snip>
---

   [PATCH v1 0/7] <snip>
---

Press Enter to send or Ctrl-C to abort

Connecting to smtp.gmail.com:587

---

   [PATCH v1 0/7] <snip>
Traceback (most recent call last):

   File "/home/narmstrong/bin/b4", line 8, in <module>

     sys.exit(cmd())

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/command.py", line 341, in cmd

     cmdargs.func(cmdargs)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/command.py", line 86, in cmd_send

     b4.ez.cmd_send(cmdargs)

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/ez.py", line 1259, in cmd_send

     sent = b4.send_mail(smtp, send_msgs, fromaddr=fromaddr, destaddrs=alldests, patatt_sign=sign,

   File "/home/narmstrong/.local/lib/python3.10/site-packages/b4/__init__.py", line 3210, in send_mail

     smtp.sendmail(fromaddr, destaddrs, bdata)

   File "/usr/lib/python3.10/smtplib.py", line 881, in sendmail

     (code, resp) = self.mail(from_addr, esmtp_opts)

   File "/usr/lib/python3.10/smtplib.py", line 545, in mail

     self.putcmd("mail", "FROM:%s%s" % (quoteaddr(sender), optionlist))

   File "/usr/lib/python3.10/smtplib.py", line 154, in quoteaddr

     if addrstring.strip().startswith('<'):

AttributeError: 'NoneType' object has no attribute 'strip'


I figured the "from" field was missing from my gitconfig sendemail entry.

I checked and nowhere this "from" is required for git-send-email, perhaps get user.email or sendemail.smtpuser as fallback ?

Neil
-- 
Neil Armstrong <neil.armstrong@linaro.org>
Senior Software Engineer - Linaro Developer Services
https://linaro.org/services
