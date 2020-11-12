Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.5698.1605194498881459839
 for <tools@linux.kernel.org>;
 Thu, 12 Nov 2020 07:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HqAUdEHz;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 11so5548231qkd.5
        for <tools@linux.kernel.org>; Thu, 12 Nov 2020 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gd3wzvlqpqSv6opFviL5pQxJHXyEC7zvRshpIvLFiUk=;
        b=HqAUdEHzBl/781w50SJMxz1DOuFE3k36JFjeuVh/wvAI78+4HTM4y9AiO33d//FAtQ
         UarmcBFrdSXasilVE5FIhpm/FwBFA3GkFKs0FDEdzyMFBds87R7ORadmi/QahzPMeqgF
         KM/kuwcH0WSGlC0/9NjAktkjIW1+kr6gPAChrAYddKh6UhRkxoxcDxQo30xE1m/3ULy0
         1DIwpsK3l+kWc+KbDkPwO2A1JKxeKFASsitZ665lidQjEHVX2HrbVN/3MO4ImyP7ZEM2
         lHM2WWTNkGNwb54wt27KlH3Yz7Z3s0krpun1O1epKtxXobRYIV4O2ZHA2SejeJmSz74G
         G1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gd3wzvlqpqSv6opFviL5pQxJHXyEC7zvRshpIvLFiUk=;
        b=iZFxJ74ADcjJdy2Nmo/JuHONFXtG5f1lHIuPoPZwaW5vBmrEpVt8HYcnj/1xaBav62
         fXLsDR+3K8XjlRo1hmRhyPelWvlX+KM6exCsAoUiowMmzE1N+2jHBFNzFvUletT+LpTi
         P+hhdmv8ZMxvtCWwhEfAVjIKocol4r2tNpF/v/11eZGStURS3DPfGx9pmSrKuHt8GP9z
         IUI5CWiMMN/a6LNKpwpzc5UKngDpJTtGSjbosghAfPLn5jKeKpCoEUKMtd2fHO9bOeBO
         unRp3kAucpUc+RfLegZxqTtbdh22Gsm8I/1JjWeXzvB7TYJRaMi3ZhFB7P/Ila/8qhoi
         Stgw==
X-Gm-Message-State: AOAM5330Xf7agy9/DxWrRTvlipxhv7xIe63Wx7OMjkSMmJ+IgUH1kVbE
	T7dQGMa2m/+Iadgr/VZFjOeYDaf3LLv6XQ==
X-Google-Smtp-Source: ABdhPJzjab2keySiwAg/3eRBky81uE3mBPFFZ/YHEwzGMqzUhfMKIXfVPspG7XUV+4DmGpT0cG33HA==
X-Received: by 2002:ae9:ea18:: with SMTP id f24mr213564qkg.135.1605194497796;
        Thu, 12 Nov 2020 07:21:37 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from localhost.localdomain ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id k70sm5230351qke.46.2020.11.12.07.21.36
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 07:21:37 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
Subject: [PATCH b4 1/4] Add '.venv' to .gitignore
Date: Thu, 12 Nov 2020 10:21:31 -0500
Message-Id: <20201112152134.96498-2-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
References: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the built-in Python3 module 'venv' to create a virtual
environment, it is common to name the folder containing the virtual
environment '.venv' [1].

To help developers wishing to use a virtual environment to develop the
project, add '.venv' to the .gitignore file.

[1] https://docs.python.org/3/tutorial/venv.html#creating-virtual-environments

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 5d6f10a..e0d7c2e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,4 @@ __pycache__
 *.patch
 *.mbx
 *.cover
+.venv
-- 
2.27.0

