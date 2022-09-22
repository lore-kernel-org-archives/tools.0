Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4192560;
	Thu, 22 Sep 2022 21:10:38 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id y11so11038330pjv.4;
        Thu, 22 Sep 2022 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=i2oN8YDgefiVDxn9HYVC14Sbr+zrO/LS91/n1YEulpM=;
        b=oRrWA17EtUusGqYwds7Cx08qZWLvk9j35r4NtDc+anVTCNlaIsDvQmt3Nm93g5tXsv
         OqQTAh4MTx4m1OdIHbZyIgMoJIPNhX9IaI52Vd06XeLFx0avxAwFTnqttWEpkIiMoH48
         9hGCWI1IhQU7k/hUs9Ck2pHC7kobvBb8Ugh8IWCb5BVN/sIdfpGX6TDmKDhzFRfLTEgm
         PnH61Elmqc9mOkVJW2jn9lu+G7DBIq6eBWQpBS5z2p5GCmJ9Z5n29sGOdsO8FHZP1GLY
         HxyX8IHrIpQRhP4BpvlaWPqw/ahQKBnguF0IeCvbLLhXWg2Ke86KyfqsfKnQtFF6YW8m
         at+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i2oN8YDgefiVDxn9HYVC14Sbr+zrO/LS91/n1YEulpM=;
        b=rEKJPAWsnC0ovgIJV6NBadVxW05VSgt/JfwToFQgN1TyJqAUEisZs29S/F5HFU4qr8
         AsTxomiOcg3EQdG1JY8wRq52xF5cMDfWBS/YBd4f/ikwCYhmjlDyfmW+RWHY3iIGC7be
         Vo6FWYSYx+AaOEhzgM6syJAjEiwJypvTtMo0h80nMu5nwgioAMghcY6GnOLRrPCeeCyK
         iPg7Kp6PjhfBgFpdvDb/lObyih/hiFRLWv0xqA1OZIfhGAP6od7lCM/MX8QWjYsKzY/w
         z0YQBepynSLhFgP0/Yjtk7uiMF+xYPHrIo09L3DAZFMI/2wdFRjRWIq9HcNFlXkITmE7
         l0Yg==
X-Gm-Message-State: ACrzQf37AWjB2megciSXUQ5a7KuRWsBJk4l6f9asjix3yQouk0CZyy2n
	jpNpP7yeCZNx1ghM/Xijo3s=
X-Google-Smtp-Source: AMsMyM50/mlIPxm9ElaMOK0XtwLMJv91ISBxhXPhJxAjm+aREGsuaUou+kyeYmwCckWyHRn9HjZN+g==
X-Received: by 2002:a17:902:e5c9:b0:178:5a6f:6eb8 with SMTP id u9-20020a170902e5c900b001785a6f6eb8mr5364613plf.42.1663881037904;
        Thu, 22 Sep 2022 14:10:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c558:d894:7bf:3842])
        by smtp.gmail.com with ESMTPSA id v1-20020aa799c1000000b005360da6b26bsm4802037pfi.159.2022.09.22.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:10:37 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:10:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 is having trouble with unicode emails
Message-ID: <YyzPSrTcGliahL+a@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Konstantin,

It looks like b4 does not like non-acsii in emails, and fails for emails
like "Marek Behún <kabel@kernel.org>":

dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$ b4 send --no-sign --not-me-too --to='Marek Behún <kabel@kernel.org>' -o patches/gpiod-from-child
Converted the branch to 4 messages
Populating To/Cc addresses
Will write out messages into patches/gpiod-from-child
Traceback (most recent call last):
  File "/usr/local/google/home/dtor/b4/b4/command.py", line 358, in <module>
    cmd()
  File "/usr/local/google/home/dtor/b4/b4/command.py", line 341, in cmd
    cmdargs.func(cmdargs)
  File "/usr/local/google/home/dtor/b4/b4/command.py", line 86, in cmd_send
    b4.ez.cmd_send(cmdargs)
  File "/usr/local/google/home/dtor/b4/b4/ez.py", line 1268, in cmd_send
    msg.add_header('To', b4.format_addrs(allto))
  File "/usr/local/google/home/dtor/b4/b4/__init__.py", line 2878, in format_addrs
    addrs.add(email.utils.formataddr(pair))  # noqa
  File "/usr/lib/python3.10/email/utils.py", line 91, in formataddr
    address.encode('ascii')
UnicodeEncodeError: 'ascii' codec can't encode character '\xfa' in position 9: ordinal not in range(128)
dtor@dtor-ws:~/kernel/linux-next (get_gpiod_from_child-remove)$ b4 send --no-sign --not-me-too --to='Marek Behun <kabel@kernel.org>' -o patches/gpiod-from-child
Converted the branch to 4 messages
Populating To/Cc addresses
Will write out messages into patches/gpiod-from-child
  0000-get-rid-of-devm_fwnode_get_-index_-gpiod_from_child.eml
  0001-devm_fwnode_get_gpiod_from_child-is-going-away-as-the-name-is-too-unwieldy-let-s-switch-to-using-the-new-devm_fwnode_gpiod_get.eml
  0002-devm_fwnode_get_gpiod_from_child-is-going-away-as-the-name-is-too-unwieldy-let-s-switch-to-using-the-new-devm_fwnode_gpiod_get.eml
  0003-now-that-there-are-no-more-users-of-these-apis-in-the-kernel-we-can-remove-them.eml
---
DRYRUN: Would have sent 4 messages

Thanks!

-- 
Dmitry
