Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D434A842
	for <tools@linux.kernel.org>; Tue, 23 May 2023 10:44:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51144dddd4cso1104108a12.1
        for <tools@linux.kernel.org>; Tue, 23 May 2023 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684838679; x=1687430679;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvJC79ikDXU4qSsdbBl+rJY1/H+nfDJgTY+0DZduoVI=;
        b=X8kExs8Qi4DjV55k78J0fG90BJTY5M4SOmKzYj0cwIIfa8di+mtmn4s7ov/8VGA3J8
         VzyTER2uI+dCu82CCmzOHpoy42M7wfQviS51ubOq6NRMhceox9qw5fE19+CG/tmN0rKO
         DizqGlhKQJBnTDD23Lq+pN0TeYMUFDqasvpOtVyY6DRZ6+/XCSmfKUMGkpItP78erbLM
         iJTlwO1F0cg3VYrFuNV0E7kp9rPvPZZkxDnX15gt2Kgl67dFGhIJnUpIqz5/H7AQ1Eue
         O19TrYxccG2w1LYZum/kSn3VxeKiRiALfKf7c30BufZlhq4nwkz3quO8vpIXgHI1yyLd
         Z8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684838679; x=1687430679;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvJC79ikDXU4qSsdbBl+rJY1/H+nfDJgTY+0DZduoVI=;
        b=UeRODbB7lMKsthzP/z3spSTKvo0No/LpPnus/idx03RfZjVfGa7MN/dpQ6HeJy79ZG
         2czzIHwUe+w43DVdKEazq2Vei4Zu+HWJUGpCOpe2xqGd+L4uSmc2KGyusOmaOA8fg4Z5
         s9reh6L1BgsdorZBaZ35DsJSjHa3zew4slDfHCV/DiEVqtGc8dF6lGv/HCT7Bql+bmqE
         0eH4Hk3Qxj3wF4cjYKPSW3bIXFpsM2ucF08QGjnOQOqNhP9WodQqwmUrOKRDM5vbW8CZ
         ajrgu69i6TR+d7e8+wSAZOzR+1c4IrUOrBqnhhK0BsuRseQ2OpomB+ryJQWrJtJpTgoP
         v1iA==
X-Gm-Message-State: AC+VfDzIj0w0z5jDH0Y+cgmLDaIhYOeMjpGRsRzyocuUmfKiyLictW1C
	QKsRT8QA5ceElp2PJ/XjDztfRxX3OvgodD5fPdM=
X-Google-Smtp-Source: ACHHUZ5bCzaHk50Ho6bwWIlsBn7xDLmtZx2svE8AzwKq3w2cT2n8YxciB+Xc8Ex8Cz8POWdhunnK3A==
X-Received: by 2002:aa7:d0c3:0:b0:50b:c693:70af with SMTP id u3-20020aa7d0c3000000b0050bc69370afmr11552943edo.2.1684838679030;
        Tue, 23 May 2023 03:44:39 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7d487000000b00506b2af49fbsm3866000edr.81.2023.05.23.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:44:38 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Tue, 23 May 2023 12:44:17 +0200
Subject: [PATCH b4] docs: fix smtpServerPort option
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230523-fix-smpt-port-config-v1-1-cdc99e39b866@linaro.org>
X-B4-Tracking: v=1; b=H4sIAACZbGQC/x3N3QrCMAyG4VsZOTYQuwnqrYgH/Um3wExLO0UYu
 3eDh+8HD98OnZtwh/uwQ+OPdClqcT4NEBevM6Mka3DkRrq4EbN8sb/qhrW0DWPRLDNOTOl2peg
 pJzAafGcMzWtcDOt7XW2sjQ3/vx4QJngexw+BdVP+fwAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684838678; l=934;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=psOfq9u1DrGt+vX6VuFwfmgdWUwpviJn26poLaSwWzQ=;
 b=nzG7PzvyiZiq0y0x6pREoco1f2sbMi4fy/jzyCwejd0QpVDPs89jCoUuArscoSEDWBjR68t8K
 VEc7tlmjUOqCkhPuHKw4x18PY1LflG3j04AZZLQJP2lD7b/HknJ7Mqe
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

The right name includes a "Server".

Link: https://git-scm.com/docs/git-send-email#Documentation/git-send-email.txt---smtp-server-portltportgt
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 docs/contributor/send.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index bff67aa..9be8d1c 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -130,7 +130,7 @@ servers will only need the following settings::
 
     [sendemail]
        smtpServer = smtp.example.org
-       smtpPort = 465
+       smtpServerPort = 465
        smtpEncryption = ssl
        smtpUser = alice.developer@example.org
        smtpPass = [omitted]

---
base-commit: bfdf5b3b0835c8c351abbcd9b3b5268acf6545fa
change-id: 20230523-fix-smpt-port-config-4e0d980ca0fd

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

