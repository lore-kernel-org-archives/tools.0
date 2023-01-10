Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E9CB420
	for <tools@linux.kernel.org>; Tue, 10 Jan 2023 21:46:36 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id e205so11237682oif.11
        for <tools@linux.kernel.org>; Tue, 10 Jan 2023 13:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdK3xWCijhIS3AaZYeaspnX8wlu1VBmxIuiePhHuOzI=;
        b=G5Jg/SOhbLV8JhPAxx9Am/0UqfeE3VE9wZ8hluufmDlIxxq+0BNMRT7dOQqWOR1j/K
         50HROKToOgEODHK8uUopIeyuwAnvYaWk3xdCPB0JHspEgZjkJHCF1dP+L/IF1Z8y2QjD
         Rl+rZHhKusYw+WPv8dJZWWr+Kdbw9qIYSBcPintyGQkvZNL/tlEOesVRaTk5QXnJZdLA
         iuBfZnG55GOoS7S9IuN25I4G/8b3G7VZ2BQs78Wc45KtW5sNpACdi59vreXd9xRla/zQ
         oyrnEFsVZMb1WfPU8JWK9GaJ4geVXxRYcQHREsuNFf5J1QvjtQWw0bFThKQpuqiQEsd4
         cp2Q==
X-Gm-Message-State: AFqh2kqZ0JR7VKTKp3F6XIU77+DVXsIDDgF7qOX5lV6Kyug6XFSvQaOG
	jL3lKvKasvxIHHE/Kcr1VUPnS4Cdug==
X-Google-Smtp-Source: AMrXdXviQKLub/collR4B3RDtzkjJLGu5FMpJ6fec0iuBAZ4q5RAQvy3d9lCYj66d5wv7XPlVA0BdA==
X-Received: by 2002:a05:6808:c5:b0:35c:3330:3a28 with SMTP id t5-20020a05680800c500b0035c33303a28mr31927307oic.56.1673387195046;
        Tue, 10 Jan 2023 13:46:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y18-20020a0568302a1200b0066f7e1188f0sm6683602otu.68.2023.01.10.13.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:46:34 -0800 (PST)
Received: (nullmailer pid 3047298 invoked by uid 1000);
	Tue, 10 Jan 2023 21:46:32 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Jan 2023 15:46:07 -0600
Subject: [PATCH b4 1/2] prep: Fix splat with --auto-to-cc when a branch has
 no commits
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-prep-opts-v1-1-8e7d7b861849@kernel.org>
References: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
In-Reply-To: <20230110-prep-opts-v1-0-8e7d7b861849@kernel.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12-dev

Running 'b4 prep -c' on a branch with no commits will splat. Print a
friendly message instead.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 b4/ez.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 36f935ebe993..1b7e390b7744 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -1819,7 +1819,12 @@ def auto_to_cc() -> None:
             logger.debug('added %s to seen', ltr.addr[1])
             extras.append(ltr)
 
-    tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
+    try:
+        tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
+    except RuntimeError:
+        logger.info('No commits in branch')
+        return
+
     logger.info('Collecting To/Cc addresses')
     # Go through the messages to make to/cc headers
     for commit, msg in patches:

-- 
2.39.0

