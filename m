Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0CA7498
	for <tools@linux.kernel.org>; Sat, 15 Apr 2023 19:31:20 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id dw2so30737156qvb.11
        for <tools@linux.kernel.org>; Sat, 15 Apr 2023 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681587080; x=1684179080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Irete0T3ybMRlZOJLSsPU9NSiuY7uU8U7nsV28q8Ztk=;
        b=YVg2o3VHh+x6cABfeKjSAUUfBfiQYYqZ059CmD//gGLqdbQXdnuInuiNCL+bbJYVN0
         O5UstyN5cLFTAD9SO8BcH4jg1mno3REGvMzBowh7ZklexsSqJq8swgQCsieHVVi6PUc1
         Kq7kEeH9pjdjuDAi6RCji4PFjM6Oh49CnEVMr20xh1GO1RcxTPgrp83/eqR0sTN0BVKu
         i1GPJyTEtJEmC4qjA5E4bQC8kN8CR0rTxVy3PVdNcAsADV0LNJMbvZDKWV+EJU1mBJhy
         9jfec8OgZy5m1ot30VNoP8VxRezcsUWrOr6G43TNXBBf//3yNa8Z1oGRIG0gDFYSq1c0
         YZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681587080; x=1684179080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Irete0T3ybMRlZOJLSsPU9NSiuY7uU8U7nsV28q8Ztk=;
        b=YbbPWKFNaiOzQeWSfR6Qktm4RpZAvpjuPM33g4A5QxFk5X5oiCBuDFcmlSiDirlThG
         GpWJrbM+IhqCfnHylJR+sdor7mathV1YEFsL4xlWKBpfZRpMcaOCZ0GwFS2XQRdb2uB/
         tjx/KiOCbzy5KQkR3YX/fh/+ErittTO+jCu4naK24B2cJ/+N89Pm4/1CHK6RZI3tGfQ9
         h7H4jNIm8OUi0/w8pKHLzEyXfNgjxCZvxlajX9lb/SIxgKYqZxdlflFRibL3Grub3CR3
         /V7afYNs56oxbWuymj0yHW7C0Clb/yXi56oCFTO1iOUTSgd25YXWm/IFxoC2eZUqg3IF
         RQ4Q==
X-Gm-Message-State: AAQBX9ciL0ES0DNAC9BhGlo7r+46Xn9vrbM+lF1IcYzWoI0X3rLb5TZp
	28FqyqZIsy8LL6U777rgoMzTw/GsJQE=
X-Google-Smtp-Source: AKy350ZipcLRUTs46ULtSj2EdXTddReyuny20zmNihwKCCHWpwXNixFCcyEa15Mq12APfVFwCNUGGg==
X-Received: by 2002:a05:6214:21a4:b0:5a9:609d:e239 with SMTP id t4-20020a05621421a400b005a9609de239mr11080950qvc.48.1681587079825;
        Sat, 15 Apr 2023 12:31:19 -0700 (PDT)
Received: from [127.0.0.1] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id f21-20020ac859d5000000b003e38f7e4562sm2086707qtf.69.2023.04.15.12.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 12:31:19 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sat, 15 Apr 2023 15:30:59 -0400
Subject: [PATCH b4 1/2] mbox.py::make_am: simplify check for early return
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230415-am-cherry-pick-suggestion-v1-1-8951a2274256@gmail.com>
References: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
In-Reply-To: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-c01b1

In mbox.py::make_am, we check if the 'lser' LoreSeries returned by
lmbx.get_series is empty, and return early with a different critical
message depending on wether wantver was given or not.

Simplify the logic a bit by using a nested if instead of two subsequent
ones. This will make the following commit's diff simpler.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/mbox.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 7060564..05c40e9 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -57,11 +57,11 @@ def make_am(msgs: List[email.message.Message], cmdargs: argparse.Namespace, msgi
         reroll = False
 
     lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers, reroll=reroll)
-    if lser is None and wantver is None:
-        logger.critical('No patches found.')
-        return
     if lser is None:
-        logger.critical('Unable to find revision %s', wantver)
+        if wantver is None:
+            logger.critical('No patches found.')
+        else:
+            logger.critical('Unable to find revision %s', wantver)
         return
     if len(lmbx.series) > 1 and not wantver:
         logger.info('Will use the latest revision: v%s', lser.revision)

-- 
2.39.1

