Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3986130
	for <tools@linux.kernel.org>; Wed, 12 Oct 2022 23:04:31 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gf8so365717pjb.5
        for <tools@linux.kernel.org>; Wed, 12 Oct 2022 16:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=c8+oJRTDl+LkORsNo2RtFAh54r3YxJqQQKAxLkhtx1k=;
        b=Od9S6sDOv8k5vAs1L80W/Ehf12kCzhsT12ENZkGq9jtXGajjHpS2Ickfhri+ItC0z+
         dvcdf21uOtdvPh5mpvGbKzVAfplY009G86ElqjdxRfTmUHsCzcWsW9CYM0ZbW8zhlQ9Y
         BDTNe1survhPBIZvALSjF7CVYC3ItwlZw9hTaFv9Hdnr/ZPZfmPVIaGMpui8VOwVW2Am
         tE9n4xWZfqYDf4rcyqcVuGD/oSpTtSlba0vbD1Ds0upo8eRIgSw3rRJ9YxVHUZnMetfC
         nLdABfGZUXFaeqzBWLz37Ptg3ltyfYtium1BLEKIhUdfFkABLR5F+bbrse6lmd/ojC74
         l2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8+oJRTDl+LkORsNo2RtFAh54r3YxJqQQKAxLkhtx1k=;
        b=Oc+233+KMr6fTzrhpClSfAxiCh4jymiNYXS+jE1DmDVswGQZx9O4ls8nRrsnrJxlwR
         F4AnVfmUPxX7Ar/iwU1N6Syxs6gdNimB7xFeY3ltSVoykNj31GMGuIhhV2q3vy9J8Gqv
         6O75JXJIy2PnMrlZ35TgcGFHfRKFsmWfKZ1B+fHuJy/vOenFM6kqac8cpPBCthn7g4PO
         a3Rkaugci6FOuCG0Cn6LFMu2a0CxSr5QFU3OU98bhy5gjtP/BPCOXhK7Q/NtENLk41rp
         lN9QxLcZG4MuQXGCREF4wkmzA2v4YiSf1SrifW6J7JcvDfMKT3TgRbcmQuGh27mUYL8D
         RQ7Q==
X-Gm-Message-State: ACrzQf2yb/Sb1b4lNJ695UplygUfxIJQZLPw7DEWQkro4JEsmlIxaUvE
	NbYyWbUXn8Lo1kjbZqNJJC1BQvF9urFFYg==
X-Google-Smtp-Source: AMsMyM54x4QB5MyKLjhy/Z678ZpTbElvQ3VLMDp+EBp/yUbzJfR5IyRvWqQp5FCclXHCLxsGB83TEw==
X-Received: by 2002:a17:90b:1d4d:b0:20a:794a:f6e7 with SMTP id ok13-20020a17090b1d4d00b0020a794af6e7mr7752923pjb.151.1665615871347;
        Wed, 12 Oct 2022 16:04:31 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d64-20020a633643000000b0046ae818b626sm1052297pga.30.2022.10.12.16.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 16:04:31 -0700 (PDT)
Subject: [PATCH] pr: Provide more information on PR fetch failures
Date: Wed, 12 Oct 2022 16:02:00 -0700
Message-Id: <20221012230200.29306-1-palmer@rivosinc.com>
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

The error message that triggers when b4 is unable to fetch a PR doesn't
indicate whether the trouble was in parsing the message ID or in
fetching from the remote.  This provides more information.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Turns out this was just a PEBKAC, I'd forgotten to turn on my Yubikey so
I couldn't fetch from kernel.org via SSH.  So I don't really need this
any more, but maybe it'll help someone else who ends up doing the same
thing.
---
 b4/pr.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/b4/pr.py b/b4/pr.py
index 1c00e75..f728828 100644
--- a/b4/pr.py
+++ b/b4/pr.py
@@ -495,7 +495,12 @@ def main(cmdargs):
                     break
 
     if lmsg is None or lmsg.pr_remote_tip_commit is None:
-        logger.critical('ERROR: Could not find pull request info in %s', cmdargs.msgid)
+        reason = None
+        if lmsg is None:
+            reason = "unable to determine Message-IDe"
+        else:
+            reason = "unable to determite remote tip commit"
+        logger.critical('ERROR: Could not find pull request info in %s, %s', cmdargs.msgid, reason)
         sys.exit(1)
 
     if not lmsg.pr_tip_commit:
-- 
2.38.0

