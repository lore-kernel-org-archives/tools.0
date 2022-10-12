Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1B612F
	for <tools@linux.kernel.org>; Wed, 12 Oct 2022 23:04:33 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 128so78319pga.1
        for <tools@linux.kernel.org>; Wed, 12 Oct 2022 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=iO4XZOY9wRrRrofJa1iOreX1rI6Orql0TquOMUiruc0=;
        b=d91WU8TD1BQiYcAx5kxSHyE6EH0CJousu7iedujo5tU7T0RDWngRffAcBIjeMoR74u
         4Asdq36B0Sp5GSk3YMRPHEG4OK+SwTeDKi4RbiXPutHqraXrws8eryIgWQoZxg4NHYXI
         TiUMj0hEWii1HQ2JvJT4Cvzgp3Byv2/sMyoNHhzBfYh/JSSuNZghaLN7Yu71C9t6AAU+
         SYfHDFzTPbQjdtkiPtxIpEbZDGo7VrIet3W1hY4GThTDEpyXC+0IpiecR05iyKVMDay3
         3QdHKUvHe3xv+3432ERkeH67v6o2JqhWWsts0QzXuMV7E/UFE9Z1KHj/bchilhQ5ErQm
         5Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iO4XZOY9wRrRrofJa1iOreX1rI6Orql0TquOMUiruc0=;
        b=6T/rjWEreQ2MpYQMqu+uk6kAUv/mEIWyRzy0ZqtL+o8mRQJLQioOzIsjEKmzXdo6ow
         NVEUJwxe9phALdFHcPAkKis4HhJqC8jTa3anhs1dE9YhiqRiI5LaV/a1JwwJbORT6vh8
         vMAzdNG0XmHrZCq71bFpFkT3Rocr7wPpzgVKKlSiqlCvWNsvB7KJxEBrBnVQtZotD9zv
         D20tel5D5LSGvmqSINEd6Q/3hAK72gSjreTDtc7oJxKEtydyKC45ieq8izuQX2X5P4gp
         PIkog6nmk5bdT+ZWGrR3VH8rdT8etkqjIHL70uQwlLfFY7sP5eCoGmxAqFmaGoKWyIzi
         Y5zQ==
X-Gm-Message-State: ACrzQf12dX/P253scVG70yI3nqhuiNmFN0R3/ZUx+pNok2N3aK8ohvrb
	grXLoAi48FsVUzGgAhxxrDJ52/BtwFsSMQ==
X-Google-Smtp-Source: AMsMyM5h4T3byicZOIv+JD1Z/YW4+oLSkU8ExiV5ndGuXfIZu+Cvm2VmtXshMU44u3vh4ZnaIASgRQ==
X-Received: by 2002:a65:56cb:0:b0:460:442e:b293 with SMTP id w11-20020a6556cb000000b00460442eb293mr20599785pgs.49.1665615872604;
        Wed, 12 Oct 2022 16:04:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x17-20020a17090a531100b0020a7d076bfesm1935855pjh.2.2022.10.12.16.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 16:04:32 -0700 (PDT)
Subject: [PATCH] pr: Add --nostdin, to disable TTY detection
Date: Wed, 12 Oct 2022 16:02:11 -0700
Message-Id: <20221012230211.29402-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
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

I'm running b4 from a bash script that does all sorts of wacky stuff to
try and talk to the Yubikey, which causes "b4 pr" to think I'm trying to
pass it message IDs from standard in when I'm actually trying to do some
via positional arguments.  This adds a --nostdin command-line argument
to turn off the automatic TTY-based detection and just force positional
arguments.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I added this to b4.5.rst, not sure if that was the right place to put
it.  I noticed some other arguments in the source that don't appear to
be documented in there.
---
 b4/command.py | 2 ++
 b4/pr.py      | 2 +-
 man/b4.5.rst  | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/b4/command.py b/b4/command.py
index b16043e..7fcf73f 100644
--- a/b4/command.py
+++ b/b4/command.py
@@ -194,6 +194,8 @@ def cmd():
                              'the identity must match a [sendemail "identity"] config section'))
     sp_pr.add_argument('--dry-run', dest='dryrun', action='store_true', default=False,
                        help='Force a --dry-run on git-send-email invocation (use with -s)')
+    sp_pr.add_argument('--nostdin', dest='nostdin', action='store_true', default=False,
+                       help="Disable TTY detection for stdin.")
     sp_pr.add_argument('msgid', nargs='?',
                        help='Message ID to process, or pipe a raw message')
     sp_pr.set_defaults(func=cmd_pr)
diff --git a/b4/pr.py b/b4/pr.py
index 1c00e75..6c5da58 100644
--- a/b4/pr.py
+++ b/b4/pr.py
@@ -472,7 +472,7 @@ def main(cmdargs):
     gitdir = cmdargs.gitdir
     lmsg = None
 
-    if not sys.stdin.isatty():
+    if not sys.stdin.isatty() and not cmdargs.nostdin:
         logger.debug('Getting PR message from stdin')
         msg = email.message_from_bytes(sys.stdin.buffer.read())
         cmdargs.msgid = b4.LoreMessage.get_clean_msgid(msg)
diff --git a/man/b4.5.rst b/man/b4.5.rst
index 073f32a..4dd079d 100644
--- a/man/b4.5.rst
+++ b/man/b4.5.rst
@@ -253,6 +253,7 @@ optional arguments:
   -l, --retrieve-links  Attempt to retrieve any Link: URLs (use with -e)
   -f MAILFROM, --from-addr MAILFROM
                         Use this From: in exploded messages (use with -e)
+  --nostdin             Disable TTY detection for stdin.
 
 *Example*: b4 pr 202003292120.2BDCB41@keescook
 
-- 
2.38.0

