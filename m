Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586149455
	for <tools@linux.kernel.org>; Thu, 30 Mar 2023 20:15:31 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id o25-20020a9d4119000000b006a11eb19f8eso9512980ote.5
        for <tools@linux.kernel.org>; Thu, 30 Mar 2023 13:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680207330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UkzL3rllHsAvQRVc8PgvCQ7D2bpjDSybU5Ax/yqFNQ=;
        b=YY2tjxTj0ONjI/f3u62FPGxwx3minSmYDzQ0+omqTb8RuSLqxmaSXig0MJYIp9e2UO
         w5P641Qkee6HSWngNpAoLBkS7dTLyiykcOs0ybB0bQrFUNeb5rwLGz3V8w9UobJJnkhY
         dq4Fd+0WgKJMzQlvooHs7AOVJVMA/9v8Xn5E2MkmETZ7FnAYkSoa2vcVEk9Jdgv8Terr
         6Jj8fAhW5rw44aXOgidET4MiHahQNKHMjSpLwMVxhBNbZoHe09ydhYQEwCqfNNJdwR0j
         QOBVa6fXXAlYHXnBOhO+WGsZ3D7gLR2Hew2mOFlAOtHD7jG3sTl4QBcKd4oa+1TTjQeo
         j95A==
X-Gm-Message-State: AO0yUKXN4ty2oKkr2AuD2XdPObTFpEZCyORhnrtf8F5aJ791Bx1yUJXT
	wrRsGzndFw7QZU+97Wda2AoURdduhQ==
X-Google-Smtp-Source: AK7set83CvZIFpWkPrOWtu/229R5Mnxeaz1ef4NELKJFQeSd5pNvwLy2mLKkvVSdq/TkwMFz8Fk6gA==
X-Received: by 2002:a05:6830:146:b0:69f:9400:ecf2 with SMTP id j6-20020a056830014600b0069f9400ecf2mr11823746otp.7.1680207330405;
        Thu, 30 Mar 2023 13:15:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d6acf000000b0069f0794861asm298367otq.63.2023.03.30.13.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:15:30 -0700 (PDT)
Received: (nullmailer pid 2744302 invoked by uid 1000);
	Thu, 30 Mar 2023 20:15:29 -0000
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: [PATCH] ez: Fix 'trailers -F' used on a single commit
Date: Thu, 30 Mar 2023 15:15:29 -0500
Message-Id: <20230330201529.2744290-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running 'b4 trailers -u -F <msgid>' on a single commit fails:

CRITICAL: Failed to convert range to patches: Could not run rev-list None~1..409ee53c38a1d9a60e76ffa92088cfad07cea850

The problem is the loop is exited after 1 iteration and prevcommit is never
set.

Signed-off-by: Rob Herring <robh@kernel.org>
---
I think a base commit option and/or use upstream tracking branch is needed
here. There's probably cases where one wants to apply trailers and they
are not the author.
---
 b4/ez.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/b4/ez.py b/b4/ez.py
index cf8759015f29..1a9abd642623 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -834,6 +834,8 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
                 break
             prevparent = parent
             prevcommit = commit
+        if prevcommit is None:
+            prevcommit = end
         start = f'{prevcommit}~1'
     else:
         logger.critical('CRITICAL: Please specify -F msgid to look up trailers from remote.')
-- 
2.39.2

