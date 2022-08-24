Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19A10E6
	for <tools@linux.kernel.org>; Wed, 24 Aug 2022 03:05:31 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l5so11845147qtv.4
        for <tools@linux.kernel.org>; Tue, 23 Aug 2022 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JKKMkTnZZR59xFDhoom36GRZ80B4VE1rPn1ye68apO4=;
        b=fe0wAE8KkqJ6v/VdWlVXhAwXT/EAHzF6se5CTXnsamLmyNh6FvDBJwmhWp7fJzZCCS
         QXujkvMvWGbu1XD7yxS+rUieICb0JMwr16A5wUKExvGsjTlNksOEwvTwU4CZC6VIZHu3
         HBNCKNSUjctTjM0Zo3eseAO05oA1VSpxonzduWgvKCCP3xf12uIQsOrKUA0StMjx1Fln
         7JTQdzUiqkY6QXIn7OvKxtcPoSsmQPsayJlBx//pfK1TbxHA7DLMIzUkP6NzeR/5Y0Sz
         6lGvTI8BD2QThpvELNj5Zxch8CUBD2jzvSLr5OSQoelHdLtzMbZm9xGZ1qnQOZ5Xdyx7
         BiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JKKMkTnZZR59xFDhoom36GRZ80B4VE1rPn1ye68apO4=;
        b=qm0TpFgCj0cHSyR3Hv25H24zExcrNWE4yuy+EHnXd4G97uSa4EeL5SN0A/T+/XSaQC
         ykODjv8R7Z9EQvkk2bEYz3/jLCf0rpX3YF5WDf0wZolSJVd8l2rtBsfECB3VjljPkLHa
         wJ1YeJyypSC59DUkYbATD1E2/Ri620+oz32nILiYl8pvbhdEjgfbmUJJ39R23+lGj+fi
         hTNxTHEXgcajIV/Cw3HEsfeIZozAsbSug88qeQPJERFmDj6ywUHZRlCvwh2ONQAv/f2k
         nYYmpgp0qLxeLcngd5ALhg3UwecCDS0pwLBdFk1tyMoai2FqBiGXkJiezLVL8y0ezMdx
         6QhQ==
X-Gm-Message-State: ACgBeo2TikeBX8ZfR5PfWYQJxiO3xilG67skaJnWaLEUEFzmdEBlMv1X
	kmZbHexzKA0pFqYVN3K9kQHiduwOrOc=
X-Google-Smtp-Source: AA6agR7h1PihgLpEADIpsFvnlE0V0v01LMeBMcwhJcrBfHbvbpvIt5d0Y/3qXCrcI2L9ZNqwrGJ3fg==
X-Received: by 2002:ac8:7d44:0:b0:344:57c4:5f54 with SMTP id h4-20020ac87d44000000b0034457c45f54mr21527926qtb.446.1661310330199;
        Tue, 23 Aug 2022 20:05:30 -0700 (PDT)
Received: from localhost.localdomain (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id f22-20020a05620a409600b006bad20a6cfesm16314269qko.102.2022.08.23.20.05.29
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2022 20:05:29 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4] setup.py: bump python_requires to 3.8
Date: Tue, 23 Aug 2022 23:05:26 -0400
Message-Id: <20220824030526.49825-1-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since c95e4d1 (am: Fix broken guessbranch handling, 2022-03-31), b4 uses
the 'extend' action for the '--guess-branch' argument. This action is
new in Python 3.8 [1], but setup.py still lists Python 3.6 as the
minimum version.

This leads Pip to allow installing or upgrading b4 on Python 3.6 or 3.7,
but then any invocation of b4 fails with an error from the argparse
module ending with:

    ValueError: unknown action "extend"

Fix this by bumping python_requires to 3.8.

[1] https://docs.python.org/3/library/argparse.html#action

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup.py b/setup.py
index 1565f30..458b135 100644
--- a/setup.py
+++ b/setup.py
@@ -46,7 +46,7 @@ setup(
         'dkimpy>=1.0,<2.0',
         'patatt>=0.5,<2.0',
     ],
-    python_requires='>=3.6',
+    python_requires='>=3.8',
     entry_points={
         'console_scripts': [
             'b4=b4.command:cmd'

base-commit: e107170fc17e3e2effb6a1629a8658497f59375b
-- 
2.29.2

