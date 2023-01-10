Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE07474
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 21:46:34 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-142b72a728fso13568647fac.9
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 13:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz8sJAGfwiu7Z3+NBGhSnCMjVi/gySZ/vo5TGGOckVs=;
        b=S/G9RQAYWyAcnjTBvAhfkDniwqAfm0Qqxo9/sU0NCp52Wz3RR3dHdFLm9jSMwDzEXo
         nADZDS/boPei90+K7MV+PZpKJMf8s5wWP1iugV1jCFtaEf7ivltTVblD93qYbgAgM92G
         rBpcbc6cDWeBdRNUaivgR49ZKREkKFqes8ojAI3Hk57gSRmKg6s8//r9wW7pnroHQxt2
         8muOHuS8NmprYOJuuwwo0804RcQ06LV0cdzKUdqctOcdRi4YLiUHGmIQO1FFnmCESFkq
         4EJ3y09VM5hI1T+WzLN96xClg+UhaxoS1PO8wHleHuDuUf8WFHlrPLyVZQCgdVHb/FDV
         sElw==
X-Gm-Message-State: AFqh2kpO7rT37iCkG8q1zUEdRZcY9hTKyL7lQbGS4ES3aqeiCA4V2QW0
	YsC4qQIVe3fVsUovhf5TNH8uT2gX9g==
X-Google-Smtp-Source: AMrXdXv5pP1qx7Ug1g9qSs3J4YoO6MfA28qeBg6IraNXQdobNDhXzv+aup1BC8BFdkxclX0gp87JTw==
X-Received: by 2002:a05:6870:d611:b0:15b:ad6b:af0d with SMTP id a17-20020a056870d61100b0015bad6baf0dmr2012504oaq.1.1673387193788;
        Tue, 10 Jan 2023 13:46:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e19-20020a056871045300b001442fada152sm6386172oag.46.2023.01.10.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:46:33 -0800 (PST)
Received: (nullmailer pid 3047295 invoked by uid 1000);
	Tue, 10 Jan 2023 21:46:32 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH b4 0/2] A prep splat fix and rework of option handling
Date: Tue, 10 Jan 2023 15:46:07 -0600
Message-Id: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ/cvWMC/x2N0QqDMAxFf0XybCBtnYP9yvCh1TgDUkszx0D8d
 4OP53IO9wDlKqzwag6o/BOVLRu4toFxifnDKJMxePKBnCMslQtu5atIcepD6j0/6Anmp6iMqcY
 8LlbkfV1tNH2W/33whtTBcJ4XETof2XQAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12-dev

I wanted enroll a branch and run 'auto-to-cc' in one step which from the 
help looks valid, but was met with a splat. The same splat happens if 
one runs 'b4 prep -c' on a newly created branch with no commits (other 
than the cover letter). There's a couple of other options that might be 
useful to use on new branches. The 2nd patch makes this possible.

Alternatively, the help should be clearer on what options are valid 
together or not.

Another thing I noticed is that if we error out when creating a new 
branch after the branch is created, the branch remains afterwards. Not 
sure if this is intended in the name of minimizing modifications to git 
trees or just an oversight.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (2):
      prep: Fix splat with --auto-to-cc when a branch has no commits
      prep: Allow configuration options when enrolling/creating branch

 b4/command.py | 13 +++++++------
 b4/ez.py      | 38 ++++++++++++++++++++++----------------
 2 files changed, 29 insertions(+), 22 deletions(-)
---
base-commit: c88e6a31442bc41e9b56df763ba8b30e64d18c93
change-id: 20230110-prep-opts-0ad63b62e507

Best regards,
-- 
Rob Herring <robh@kernel.org>

