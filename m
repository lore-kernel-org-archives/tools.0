Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4F6FD6
	for <tools@linux.kernel.org>; Thu, 16 Feb 2023 16:51:10 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id ct17so1853676pfb.12
        for <tools@linux.kernel.org>; Thu, 16 Feb 2023 08:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=VNEzN64WzztDlQ9k+X7mDUJ+Hm6KbduS6p9TXDnx9mI=;
        b=zIhLFb1LUB1T0U27g1rq+bdgf/t/YlLj9swOzKlcD7AExsQDQo4H7sXFh0CVVBY+Ax
         itq7F0ma0mEsyAFX1pZbNV5XQiuiVWTcfpqw0Yoq+oJdfqtXte7HLMJuk/tRrtMZEKXX
         KhoOvUTdYN7nW8pCn8IKRuN9DuQT+Ev/0U9O4INg+TR/5E86bE30QRaFjG3qUCvlLexE
         zbhuSRoEcgCSPzOddrmVSKTLljTuYTS1IKAcfPnZ48cQYHUKAdxe5D/9jmiiM+e4Cx7m
         StYcgJza78M4IcwrDJ1IbDjb2P9WNRMHOiLn4itpaL354ioIF4VB1rY/ilv9TyGhZEMQ
         ph2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNEzN64WzztDlQ9k+X7mDUJ+Hm6KbduS6p9TXDnx9mI=;
        b=QRdaf92+ptTHLknoDN58vEjG/a3lGkvUduy9Z1ddMBrN5/LJX2fAjhyDptSqbCTPaB
         xIhtKCgJIwak3TnBB6FsmsCDZ6r+WZlNJYLDUs4Z0aOEryOTKGAteBeMBLU/QxErWPCu
         H6cQGhTKhXChnT+9eBNGByat4OrpKccyyyDmLEiu4Msyx8uFUUV38mW2EXb9C0wGBVmr
         mGar0Hr99GjoqqEQPLhWb0ieTJ8pS06MnS3DcckUVK6oQbCbx7zy3arzTgYhNpuArIvO
         GBXWn/CbAASrf3OOSmwyoAbajZYhB/1Bswt6HsSDIcvrzpnFQCFsc0FNryyty2XsK35m
         fnsA==
X-Gm-Message-State: AO0yUKWzLboFiSSqVIioJRKaP5nkgDXyM0w1FrrkHc/GK2V+vYN7JPk8
	3yfSHoCkeyN602UVGsFkQx5IIEexvAIdnI/X
X-Google-Smtp-Source: AK7set9IKz3jPs1dIT9wwYamdy+5E6Rc5UvvBJ3ngMQfRElDZChaoyIBYgJHYykyFD2/RkycyVpkjg==
X-Received: by 2002:a62:64cb:0:b0:593:d276:1931 with SMTP id y194-20020a6264cb000000b00593d2761931mr5286947pfb.14.1676566269682;
        Thu, 16 Feb 2023 08:51:09 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78818000000b00571f66721aesm1530472pfo.42.2023.02.16.08.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:51:08 -0800 (PST)
Subject: [PATCH] shazam: Add the --add-message-id argument
Date: Thu, 16 Feb 2023 08:48:41 -0800
Message-Id: <20230216164841.3356-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To:          tools@linux.kernel.org

Some projects (at least QEMU) want Message-ID headers instead of Link
headers.  I couldn't find an easy way to do that, so this just adds an
argument to shazam that mirrors "--add-link" but adds a MessageID
instead.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Using a LoreTrailer for something that's not on Lore seems odd, but it
appears to work so I just went with it.
---
 b4/__init__.py | 6 +++++-
 b4/command.py  | 2 ++
 b4/mbox.py     | 2 +-
 man/b4.5.rst   | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 4d5a6c9..5e5a5a3 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -519,7 +519,7 @@ class LoreSeries:
             self.add_extra_trailers(self.patches[0].followup_trailers)  # noqa
 
     def get_am_ready(self, noaddtrailers=False, covertrailers=False, addmysob=False, addlink=False,
-                     linkmask=None, cherrypick=None, copyccs=False, allowbadchars=False) -> List[email.message.Message]:
+                     linkmask=None, cherrypick=None, copyccs=False, allowbadchars=False, addmessageid=False) -> List[email.message.Message]:
 
         usercfg = get_user_config()
         config = get_main_config()
@@ -585,6 +585,10 @@ class LoreSeries:
                     lltr = LoreTrailer(name='Link', value=linkval)
                     extras.append(lltr)
 
+                if addmessageid:
+                    msgid = "<%s>" % (lmsg.msgid)
+                    extras.append(LoreTrailer(name='Message-ID', value=msgid))
+
                 if attsame and not attcrit:
                     if attmark:
                         logger.info('  %s %s', attmark, lmsg.get_am_subject())
diff --git a/b4/command.py b/b4/command.py
index e384031..7d73aa5 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -51,6 +51,8 @@ def cmd_am_common_opts(sp):
                     help='Add your own signed-off-by to every patch')
     sp.add_argument('-l', '--add-link', dest='addlink', action='store_true', default=False,
                     help='Add a Link: with message-id lookup URL to every patch')
+    sp.add_argument('-I', '--add-message-id', dest='addmessageid', action='store_true', default=False,
+                    help='Add a Message-ID: with message-id to every patch')
     sp.add_argument('-P', '--cherry-pick', dest='cherrypick', default=None,
                     help='Cherry-pick a subset of patches (e.g. "-P 1-2,4,6-", '
                          '"-P _" to use just the msgid specified, or '
diff --git a/b4/mbox.py b/b4/mbox.py
index 48b037a..0e988a8 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -101,7 +101,7 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         am_msgs = lser.get_am_ready(noaddtrailers=cmdargs.noaddtrailers,
                                     covertrailers=covertrailers, addmysob=cmdargs.addmysob,
                                     addlink=cmdargs.addlink, linkmask=config['linkmask'], cherrypick=cherrypick,
-                                    copyccs=cmdargs.copyccs, allowbadchars=cmdargs.allowbadchars)
+                                    copyccs=cmdargs.copyccs, allowbadchars=cmdargs.allowbadchars, addmessageid=cmdargs.addmessageid)
     except KeyError:
         sys.exit(1)
 
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 90db4d7..07d2692 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -155,6 +155,8 @@ options:
                         Add your own signed-off-by to every patch
   -l, --add-link
                         Add a Link: with message-id lookup URL to every patch
+  -I, --add-message-id
+                        Add a Message-ID: with message-id to every patch
   -P CHERRYPICK, --cherry-pick CHERRYPICK
                         Cherry-pick a subset of patches (e.g. "-P 1-2,4,6-", "-P _" to use just the msgid specified, or "-P *globbing*" to match on commit subject)
   --cc-trailers
-- 
2.39.1

