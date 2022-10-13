Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924C4405
	for <tools@linux.kernel.org>; Thu, 13 Oct 2022 18:14:08 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id t12-20020a17090a3b4c00b0020b04251529so2578919pjf.5
        for <tools@linux.kernel.org>; Thu, 13 Oct 2022 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=PaT2psA0xgeFPeL+VkvSQkj9TAM4BdkkuPQAvqOtWTQ=;
        b=dhA5zgkSoGQcst2Hl0kqpIxH2wQ/xyGIj0VC3MmvDp/hfHIDxjs/AkM16yD2ciWMXT
         h0rRyjjlNva6wW6T+vXD/tUuudvZplq+5YcC7j7MfRKuhNhQQyhKvc1ioCH+ZVFSv8z9
         85aUgFkvlpI5VyRgUSpL0NqP3ES/gvf/txA1EbP20Ztw+DFHjpsLeJqw2qzTcs63ragh
         lF7wIyxL68YOD4eyfvet/jZLJaWmg3RttfY628g3ZOrYlVj7PE1J0vWt0NX2Xzx364+i
         d4OZx73y06hSBskqaVsmy/KbjpaP+k4sn6RciD6ZFM5fz/LzUehDhaYWqCBMknwdBN+F
         xHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaT2psA0xgeFPeL+VkvSQkj9TAM4BdkkuPQAvqOtWTQ=;
        b=bZQw8KJfg8bSvKKeShnp8VWvOkKuagKOUG8mE8RfeqnRYFf6s+KVxhP48g99bwPB/w
         AP+NzJhwSj35eDKWnWMIe1rqKPVP81Bpp+CJCA5a7Hmg6VP1aBd50LxR92mzLsqTaFyh
         oeI1+vVDjbt2YoYL9d1zCufDZnUbUyvaCFilAOqn1JZVJLh3fuBNjtWRibK1Uu/Y0TCx
         vrFltFS7GrZdwj7E+bHbJudIf+yJ9eKlZ4Trub0JgbdP93mFdjm8D8DAYQXEHf/Qqzdp
         CRmYPiTwiy2QGgbOhXOGwjA1UFTlLO6T+iH09tY58S9qRouTGrvrC2L6xZnkMyTcVbOv
         VKNw==
X-Gm-Message-State: ACrzQf0FnZTmKH13L4j/yvFj9KcybOTU13De2AEx5DxwWVFHzmMIANEJ
	y+Dafoxn4mIQrkeHVxHjWhsj4JHKwliqgQ==
X-Google-Smtp-Source: AMsMyM4Ae8CLbNwVM5MbkuK5S05Bx9Re6xSeXYGxqgOxfdovQlElC6+HtJO0YUQtDqr5uK9UtcmAGg==
X-Received: by 2002:a17:903:31d6:b0:17f:8879:190b with SMTP id v22-20020a17090331d600b0017f8879190bmr1195835ple.119.1665684848458;
        Thu, 13 Oct 2022 11:14:08 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902b19600b00172f6726d8esm136591plr.277.2022.10.13.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:14:07 -0700 (PDT)
Subject: [PATCH] shazam: Don't use "git merge --edit" when non-interactive
Date: Thu, 13 Oct 2022 11:10:31 -0700
Message-Id: <20221013181031.23823-1-palmer@rivosinc.com>
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

Most text editors are interactive, so call "git merge --no-edit" when in
b4's non-interactive mode.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 b4/mbox.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index ff96a11..59073be 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -374,7 +374,12 @@ def make_am(msgs, cmdargs, msgid):
         mergeflags = config.get('shazam-merge-flags', '--signoff')
         sp = shlex.shlex(mergeflags, posix=True)
         sp.whitespace_split = True
-        mergeargs = ['merge', '--no-ff', '-F', mmf, '--edit', 'FETCH_HEAD'] + list(sp)
+        edit = None
+        if cmdargs.no_interactive:
+            edit = '--no-edit'
+        else:
+            edit = '--edit'
+        mergeargs = ['merge', '--no-ff', '-F', mmf, edit, 'FETCH_HEAD'] + list(sp)
         mergecmd = ['git'] + mergeargs
 
         thanks_record_am(lser, cherrypick=cherrypick)
-- 
2.38.0

