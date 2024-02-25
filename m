Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FFD1B950
	for <tools@linux.kernel.org>; Sun, 25 Feb 2024 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708899153; cv=none; b=lMXUiswhEJ0U37YUrbB4KFXhrPVvnvN4rkPabcoFACThmRbxoELjGeuHkYpT+w/0qIOFB4zf83XrQT6gpV5XxUvbFHbxh1yGTx/TSslZwX0Qp4VS695A8fwmTff+LNp7KfxSSiUO7e6eMr4Im0SbgN95SxnehWJCq4WNcoeULRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708899153; c=relaxed/simple;
	bh=7dWZq2XsFjtZAo2JgEm8+jtVcUao8ekRMqqgbN+OkIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdxp/9RRzK2MYy15EvXbdQsDoxsMfxGx8jHN3TZuDUAMWEInRI7SFcmzeqX8Jfewoo5rX0ZYAONoMqtaKLeEbYu5nTxcCa9fxx1xkDax8ZcJXnkmKPSyI6iPOWH6Cd1tjCaz7ZeNbQpgVNbNgZU/DUuYxgQdLbNIhv1DRX2EzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv1fyvVP; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv1fyvVP"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-787bc854a77so144818885a.3
        for <tools@linux.kernel.org>; Sun, 25 Feb 2024 14:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708899150; x=1709503950; darn=linux.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrkyKCIcPUiAMIfaXx/BPFAfuynLXQHgOz8iWXILpn8=;
        b=Nv1fyvVPczO6/zSb5w3n0hLr6yGLnCF/31yuCjmPa/dAXH6ENz9N+d3QpidHkUwvIg
         rTIrsxlIPOi1UEF1N+aakCtXrA15koMHe4XhNykgA8P6gSZOvYWNPizPlJMo+h/y4qb2
         ZSQR5RiU2bfgJn9OrQ5IgVREtThlfM6yDA1zWq3ou6CtyvguFITp2QBnlMHCll6efnIo
         qbczdNhVxvWTVsc2WTMOaQpK7ZFN4nZ+lVApqOxAgyTEoRn9OZvWk7Giooivdo19ABlV
         LhR8yR1myjPuylxUCHaGqb1x+nxrUErTp3qApln63gZoSX+lv7QPXB1k2N1ZGc8qqbhG
         XM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708899150; x=1709503950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrkyKCIcPUiAMIfaXx/BPFAfuynLXQHgOz8iWXILpn8=;
        b=E3XVyp2Vh6csqmQ+0ktJz+vOHg9yb68faY5sn7qr+iBpQudP6I8/4PbommV4kj2/Be
         W//dcYlhnqn4Jm3ZjMmtPsgDDhJJGkm2NFIBPPNvl3RlhEPfmZHiq80wJG1CmNw2wMB/
         2mEb8gnBfVNhmFfW3VbDHfDvLYYE8Qqg3PbUhoCJkM411/sxB+zVcnP4l6YEZsRa+0AH
         5uO1vRhuCsbabBvSlVeo8PY6rbXyZORNVDf8CtdVzom8kbcyrfF/1gQj2S51/80WBzGu
         COz4IkWuXwJOs59bKtS986M11+isCd/8O5ZwZpSs5Uz2fIKkaWntFtRhhZ6e00ybGpmh
         MaZw==
X-Gm-Message-State: AOJu0Yz9wxmUGgcpgLN3MBU3jHSYg+jyaAuyfVkIR8qugR1FdNgEPo8I
	pgf4hXSm6iicNiMormyDkS1rSP/FwnlSnVKoJn+otTANSaD1fy2QYqxx9pzngYE=
X-Google-Smtp-Source: AGHT+IFOZnTgD65t3C1BvAdp6qCupoxL6I3exzZu2RYEFX6Ip31xhFJyoQANxVu+V5UbKOg9afdTMQ==
X-Received: by 2002:a05:620a:7f1:b0:787:5c2d:2b7f with SMTP id k17-20020a05620a07f100b007875c2d2b7fmr7255507qkk.60.1708899150682;
        Sun, 25 Feb 2024 14:12:30 -0800 (PST)
Received: from [127.0.0.1] ([2606:6d00:11:ff90:6090:e182:bd61:ebff])
        by smtp.gmail.com with ESMTPSA id d11-20020a05620a136b00b0078726073228sm1847129qkl.26.2024.02.25.14.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 14:12:30 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sun, 25 Feb 2024 17:12:20 -0500
Subject: [PATCH b4 1/2] docs: document tokens for b4.prep-cover-template
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-ez-range-diff-cover-letter-v1-1-0df35b63bcf2@gmail.com>
References: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
In-Reply-To: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.14-dev

List the recognized tokens used to construct the cover letter template.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 docs/config.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index c46d43a..8523107 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -400,7 +400,15 @@ Contributor-oriented settings
   Default: ``commit``
 
 ``b4.prep-cover-template`` (v0.10+)
-  Path to the template to use for the cover letter.
+  Path to the template to use for the cover letter. The following tokens
+  are recognized:
+
+  * ``${cover}``: the content of the cover letter itself
+  * ``${shortlog}``: the ``git shortlog`` output for the series
+  * ``${diffstat}``: the ``git diff --stat`` output for the series
+  * ``${base_commit}``: the base commit of the series
+  * ``${change_id}``: the change-id of the series
+  * ``${signature}``: your signature, either from ``~/.signature`` if found, or from your Git config
 
   Default: ``None``
 

-- 
2.39.1

