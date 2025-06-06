Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758D323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239481; cv=none; b=S071V4LOwDc9P+DsYZ8lgQuZsUj5MzAxe43IUWWRfKZcEF5JVgNUq18UGW1hN8DDbJOYTtBp3Qgw27UEU0vtLHtPHNCT2Y7xtiYbo1spLdi2wad6Dd6KXxCsqgkBwt4HX5XiTpQteVMAYZPgHGDJN2wYliF/31B9q3hwrzKDe6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239481; c=relaxed/simple;
	bh=6lMI2xZMP6w0hpvlng3dqD63DA63euQRmjWxTUDmJAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkqLFBQawdL8NlVIG/1FnIfpCRjmrbP25xjU+MK7x3DJn/ZNrR6G/ATJedSC6LHxcVr1UTQ5os1noE09Rl8nr47L7TBnGma+koWa94Qyu5S5V5GOdIvPUQN/KCugn6KC/Hf0PR94qHw+2BXUABiTHDlFHRc1meZHsTAuSI9nZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev/DxpoS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev/DxpoS"
Received: by smtp.kernel.org (Postfix)
	id 1A4ABC4CEEB; Fri,  6 Jun 2025 19:51:21 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34E81C4CEEF
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34E81C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a43972dcd7so30539301cf.3
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239479; x=1749844279; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy8vomKFF7Aq95AdVDNhY7xOssbp7AeUmso8/wjhThk=;
        b=Ev/DxpoSb5GAzG3Ox5s8cEMD9RY9Ytkc/wCxJF54bWGsnDKkkYJVjibOSzXFwZ4vZY
         MedLr435dRx9xsgYsQMaVla4lfk+4S7yTQ1b6HpuzKtbTLuWJp4tj80kt5/pyRzNYQdU
         zroMB5+ALyFMKxlJ7qOkMtOrDZdc7lMcfbvwzJkW75L0Uo4Ot3BcqwcHWs4fEUxK740G
         3XMA7+zGRIvcrAqRHuWB09wlBlG85izyzq2FzzkLVu2i0/S9NJm9Nbge6J/ZxwqyBaF4
         Ozah/aYaEGp/tDQvRAfe8VI5ENzfy59Xy8NRseH9f3BsuWW5vunCpHsWsv7m3SBct0jU
         aYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239479; x=1749844279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy8vomKFF7Aq95AdVDNhY7xOssbp7AeUmso8/wjhThk=;
        b=Yyl5n8o6cVolsDUv3bHssdRcmhAPJBWdawNPpf1JMuENXtZM8D4UOsQWDNPAHU4nwB
         QmAiXi4XvC4OuBcgsgphijlnX/RvoqZHH0Giek+in/D5vE6jA/XN998hX337tF/Z2q+T
         7Esb6riRN9q6G9mtxOOXJZJWeIAii3eco/M107gdwtAI0+teY2xjag9HfOFvSufcxf1X
         xpbdAGUZJVhsv4bnme/UWsL9P8owY7S95aT3RnwA8nAM9An4HVukucj2sefL66rdnzDk
         Jrae+y4UJBvo/jlfGNtoJmzTOb4lMWw7HZD/Yxn0dlg2zbxxq52Erj31qn6OIN6X73Q5
         uQZQ==
X-Gm-Message-State: AOJu0YzxcMeV1dq+JE3AG00lU6+UdBiCldS6BLNpP/Bs4OKgEH8s3i8w
	bMYE3SpU4vcAFwgG02fhktcmybeti3C5jnvuc0BZpsU/dP18Y1bcG07u
X-Gm-Gg: ASbGncuQHTfOGXM6pVw7WC/LXsINrfAJLuugSaHETBioy68VrA7z2Erc4nyu4lQoRNk
	tgITuelQZRI4adnBgo/YWOPwjzQb9rMyl9D0Aw1WyLTdGUQNchTBsyrvFD1zVH7vRp7rb7WXQsY
	UH9mzmGmLqzCJAF3Ew61eYjbWRgvWhhT2GcMDukKwt92/Fa3ZIkN/9MmeYhSF2Uba4pk16OY3V4
	8Dian+Y+Mdn4HbLa8LRrpUY1kDZhOmNU5aBfa0A677E9ISZIoITSjVVm+qHVEUAXCVlyrmZJDos
	iKIjG+egvfJdpPkKzn2FeL6lGlrPqL1xWXEV7E29hpTEOU7yvLz7ZQzDBw3NXLP09EfKlCHhvo7
	fZSPUJ8hI
X-Google-Smtp-Source: AGHT+IFuAfp1zTxaD27Blk1W+0K/nV+WsYVCkcYky3M3kqWCz0KC25WlFAK3ME9Bl+seZUfY0s/FZg==
X-Received: by 2002:a05:622a:2289:b0:4a3:adbd:9836 with SMTP id d75a77b69052e-4a5b9ece184mr79784851cf.36.1749239479020;
        Fri, 06 Jun 2025 12:51:19 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:18 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:13 -0400
Subject: [PATCH b4 02/10] Specify optional dependencies in pyproject.toml
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-2-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This allows `uv tool install .[completion]` to complete without warning;
before this change the "completion" extra was not recognized by `uv`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 misc/requirements-completion.in | 1 -
 pyproject.toml                  | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/misc/requirements-completion.in b/misc/requirements-completion.in
deleted file mode 100644
index a5993ff..0000000
--- a/misc/requirements-completion.in
+++ /dev/null
@@ -1 +0,0 @@
-shtab>=1.7
diff --git a/pyproject.toml b/pyproject.toml
index 658c704..ddc4e02 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -31,16 +31,13 @@ dev = [
 ]
 
 [project.optional-dependencies]
-shtab = [
-    "shtab",
+completion = [
+    "shtab>=1.7",
 ]
 
 [tool.setuptools.dynamic]
 dependencies = { file = ["requirements.in"] }
 
-[tool.setuptools.dynamic.optional-dependencies]
-completion = { file = ["misc/requirements-completion.in"] }
-
 [tool.setuptools.packages.find]
 where = ['src']
 exclude = ['tests*']

-- 
2.49.0

