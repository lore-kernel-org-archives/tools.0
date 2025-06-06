Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1946323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239486; cv=none; b=ZICy3uE9w+LKFQOeMqTxb1drYF0GzHxiE3/LcOoCcnCyIpTu/pM+vFeeVDKY/UqEZfVQKxpL3KUcX3TG0l0zxmnr3Mt7Ev0PfILCcHPKrfgtsM9IX95IJNuufIONtf3xRQNR2Wp4grxXTbGAmPtauZ8kVIe/CDVi+mSIntZ5YPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239486; c=relaxed/simple;
	bh=LrnGJS2QVRsBSoAX7NrA5p/4wUfebjPd62wircAE854=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o15S03+V2Ibg7QaRgeD06CwAMCFaObYeqb8wgH3fvstojYXtuaNcOxc6fX9v7yJHFxo3fnRXyUoZKn+LsdzLhJUWmdsj9Zr8zG1zoMEHvRjoLNh0u7+ja4Jf3wJBBwYyXpFtR9gJv4Y65e8auETVd2dVscJXmzveH2Wzy9zGlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he0AnE/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he0AnE/f"
Received: by smtp.kernel.org (Postfix)
	id ABE71C4CEEE; Fri,  6 Jun 2025 19:51:26 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1239C4CEF1
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1239C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58c2430edso27090071cf.1
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239485; x=1749844285; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxy+Ih58MANpSuZ/SyGp9gXbzI2UgDfRAPjyOp6CJGE=;
        b=he0AnE/fnx8JEJQZqTuG724eYwEdydF5SY291F7XHRzCv1Sfu0GgxpTD9R6yYoQx6f
         kAmkXF1CsJFBJtZr/youzQYg9wgK0lUk2xKasGh7/QWdsd5YVL/y6wBQThjrotbKVSXP
         7lJlOot7/8sB83oV0JUzGv5gICKYSBNyPAVSRh/FVoEc5LFvZHZ5/9oQBeLvXbMFbPFh
         iNIk9NeOZtsJme55NL/4/qnlQRx4TJCd2GqiUiQ1SLZE10JUQSrYU//xi/cum3E3bCCS
         qaht6C/CacF1ei22+EONHquUaS1wTTwhTeaYv8DeCP+fAtME4k5pgBvOWIj0KSuaMdkt
         9xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239485; x=1749844285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxy+Ih58MANpSuZ/SyGp9gXbzI2UgDfRAPjyOp6CJGE=;
        b=jOhVcCA6Fa0oNKRGDPN5/ncYaudu7deWq09+ZGcEjBdrsCNsMPY0PMLpHwPVjdlVcC
         KRO7p6CwwlB5hskzYNR7meVZjCLvxoxEEmKv09b4UzPLqWRYt9bb0DSukrI3QFlFCqCK
         2I7wtw+fgCzVwEkrsK8f40FtPSj5TuivWFqd+PnvhWpgvtd4H3vIWvD9bVLHdhRO/+Yz
         ilw+NYr60aD4TQLR6HyeHBFlH0zPUUEwwhU5SN2R5dTQUIsIZ4eHJgQ1WCOwk7ty1jGK
         CV38eQQJt9VbVSHi/dPj9GMePIX7Q25LFRyT6uKPO5PRUhSPyVGWgrrBNsgCGTDFCyuJ
         ybQg==
X-Gm-Message-State: AOJu0YxPUdK81VSv4hwol49hhrtCzlo4g9dRLN+GtNtsYFp2TeX3z6CS
	2D5unzDxYAnl3O/2ImEj3iI8C2iOU5WfxP3cc7ngdrYUesZ3qgfgvRtI
X-Gm-Gg: ASbGncv7OT9XhA3HHHAvKe6WAkvW8JVIFiHcfAn3yv7Xh4vQxX2gHw2tAELJFNtMh5o
	j+SxqfP3afBkSj98ZL0eIcTSC3D0X7eyfpLEvKD5Kc/hxRXZzxVRIZUvA2h36X6c4IeoLs7es9s
	QKgd/gln0jMknfgswRMo3oiW9imOC3uhU95xsVvZwpZjNrRy7CEXgl3zUR9mwyrtV3kv6qihSBN
	5E+1fJDzz2HOvp6/jDCwEba/5BVox+LA7QY/3ZW16pjlN/dhqz1uTsdihdG+WqEesBpV8scc4WK
	nTQU0pz1fmVsE2YHqybhFb+FSw1fJ3AUrXOQRgcr8MvNiASDzQvceOlVDLg1AJb0hlLfIsh9Bw=
	=
X-Google-Smtp-Source: AGHT+IFL5yepKRcZ002vGkarf6nQonVWbpnDHnwy6BhgPLt1J9xlkkCxhBh5Zyc7drul1oO4YU2w2g==
X-Received: by 2002:a05:622a:1ccb:b0:48d:66ee:662a with SMTP id d75a77b69052e-4a5c06625f6mr77221851cf.26.1749239484681;
        Fri, 06 Jun 2025 12:51:24 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:17 -0400
Subject: [PATCH b4 06/10] Add mypy
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-6-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pyproject.toml b/pyproject.toml
index d2eaa54..16eabe0 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -31,6 +31,7 @@ dependencies = [
 
 [dependency-groups]
 dev = [
+    "mypy",
     "pip-tools",
     "pytest",
     "ruff",

-- 
2.49.0

