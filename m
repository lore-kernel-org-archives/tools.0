Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A51360
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 01:29:48 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id y12so6888995qvt.8
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvX7GFBdbdRJOtfMx0uMRzsL8l0PiLl4BsNZU/l8fI0=;
        b=YKXolNeoWFZJGEkVpRHfCYA6KER4IjOCRyNKJDAIGRxa36jErDPLV6M/O6ENrE0dsl
         BnNQ9q2ZRf3vzO+7nYxmtiWXkzdOJVOq0CbkjcA/c3Xls0r4y6CyZNXKzwx9/nPSlp56
         Kt81t+o1W1XjzYLm6ftAoxFjjuLT3wEu1k80eNw06n7SH6NZjadp0BJ3/Qg5Tv29UCxB
         lldXUDwQrV2TS39T4hj8ndQ7CDJ1rttHxN9Rv8IGwdhBKBxv2UCRMejI/XrX3cxBzfxj
         CS9BtGh39WN01TTh0xhllH71Vz9SiPm27C+gjFzA2XEAhWNidakVVXdd7nrON8qqG55m
         4gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvX7GFBdbdRJOtfMx0uMRzsL8l0PiLl4BsNZU/l8fI0=;
        b=dsLcNY0VRuPJc37+PAzZCw7120a/jRm2kJV+AUdPqoXRjdyUBJ25rei85ebwTtC81w
         kXgf4y9mfOOxsG2kd0IeZon+c7c63f3ThmR7Zvi17cJLEAiy+b5MpqwXwFcHFpZzRDWg
         bxq1oKZnHP30HfZN/nahkRO4DoJGGSkBO7bbIAkuBNelPuIcSokSpDWdufoQp2lazM2x
         BRgn/BtX6CFKO6tNEXwCSElwo1+EA0jtH/vGK5JVnb3rQOKjDQRVORY/EV4WS0fb4Avt
         pSDm3btYA0fF9kS+ky5pe/LILnJK73UsNLYZT6AJ8w31lDkJLKLNgpAwbyVF0UnXfDSf
         JkMA==
X-Gm-Message-State: AO0yUKW1x3X8wwQQrIxCrYx+mlSGXsxcRboFEJY8wvFxxKAeXWeyzhEo
	nf7/xMvU1U9O9IPvr/NBU/GfkxVroyY=
X-Google-Smtp-Source: AK7set+i4kJ3EVgw8hVpSFA7npX8di5SiYj2iSJfNCWRWBCq6V90sdYk5fjnx4UK3G2c5mY0+9T74w==
X-Received: by 2002:a05:6214:d49:b0:56e:f417:2ad7 with SMTP id 9-20020a0562140d4900b0056ef4172ad7mr13502018qvr.14.1677029387584;
        Tue, 21 Feb 2023 17:29:47 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor135.cmc.ec.gc.ca. [205.211.133.135])
        by smtp.gmail.com with ESMTPSA id o190-20020a375ac7000000b0073b45004754sm11872357qkb.34.2023.02.21.17.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:29:46 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Tue, 21 Feb 2023 20:29:18 -0500
Subject: [PATCH b4 2/3] ez: add '--same-thread' option to 'b4 send'
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-send-iterations-in-same-thread-v1-2-59b802382eb5@gmail.com>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-696ff

The previous commit tweaked get_prep_branch_as_patches to optionnally
send further iterations of a patch series in the same thread as previous
ones.

Expose that functionality to the command line by adding a
'--same-thread' option (defaulting to False) to 'b4 send', and pass it
down to get_prep_branch_as_patches. Document the new feature.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/command.py             | 2 ++
 b4/ez.py                  | 2 +-
 docs/contributor/send.rst | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/command.py b/b4/command.py
index a7a5aa9..21f0d0d 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -323,6 +323,8 @@ def setup_parser() -> argparse.ArgumentParser:
                          help='Resend a previously sent version of the series')
     sp_send.add_argument('--no-sign', action='store_true', default=False,
                          help='Do not add the cryptographic attestation signature header')
+    sp_send.add_argument('--same-thread', action='store_true', default=False,
+                         help='Keep all versions in the same thread')
     ag_sendh = sp_send.add_argument_group('Web submission', 'Authenticate with the web submission endpoint')
     ag_sendh.add_argument('--web-auth-new', dest='auth_new', action='store_true', default=False,
                           help='Initiate a new web authentication request')
diff --git a/b4/ez.py b/b4/ez.py
index dac5e2a..4013f29 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1295,7 +1295,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
             sys.exit(1)
 
         try:
-            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches()
+            todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(samethread=cmdargs.same_thread)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert range to patches: %s', ex)
             sys.exit(1)
diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index bff67aa..6abceac 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -233,6 +233,11 @@ Command line flags
 ``--not-me-too``
   Removes your own email address from the recipients.
 
+``--same-thread``
+  When sending a new version of a series, make it part of the same
+  thread as the previous one. The first mail will be sent as a reply
+  to the previous version's cover letter.
+
 ``--no-sign``
   Don't sign your patches with your configured attestation mechanism.
   Note, that patch signing is required for the web submission endpoint,

-- 
2.34.1

