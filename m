Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB54C85
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745510; cv=none; b=MClsrC4mAVMThsPGnIa45gHw8WvHTpCgTeHeg3BgpHEY9EU7FfRSIyZH1uVupLblzssxjs3e7fBOmAgfxY8J120NKUJwAOB6zzvLbn1/lVQH/xcgG2L1mMgHydmmfMK1ToPQAVyNdBSaajrcNfjZQVq7ePJdVdPpp4uqJpjJghU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745510; c=relaxed/simple;
	bh=eSHVxsZbpAaDPJinFw1hn3BWydnK2GH9bcKg7VSLsyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZutXeF534BQkm/prclchnuN1GLYNDqsvgpy4c0/FK3QDvOOipTr+7BmxbVnvQIcsIjR7HHhcuFoV0pkm47gVTVyiFS621YHSlVsWDG7clNcbI7tTgVqS2WRx47qliVs7clHsCoy7jViP8DqfujUZ2OkRFXQPjTbZQYFKS6n2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN9CXbYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN9CXbYA"
Received: by smtp.kernel.org (Postfix)
	id 99310C4CEEA; Thu, 12 Jun 2025 16:25:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1E24C4CEF7
	for <tools@kernel.org>; Thu, 12 Jun 2025 16:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1E24C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d09f11657cso119100685a.0
        for <tools@kernel.org>; Thu, 12 Jun 2025 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745508; x=1750350308; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcrauDTgCR7Al/8FGSIBYKujeMp2EIGE7Dwwai/CuqQ=;
        b=SN9CXbYAAJg2atYWWtgR3XAy34QGGARVvg66mj7zhVr8lJkEaJ0A9WIZzkDy0rP84u
         Jc18HyDcg18EEkQCw6hfoRKBoAooL5GVTpp4gkpjVAjj8YnI6EC8Jh6pW4eOLT7ZfOej
         e1Pe0Oid5jC/3523lX+YcO2Xu2zSQ6X6mwsB/nn69k1XeXt6Y4qEnYxXCtDiiKgdS0j9
         sB+X5C3M73jYR1G5nsBFyZ6Bht77d2B1wUBrMoBgYPUJx2WlIq1+KueTZXaTrSlgmq1E
         ovd/HuuKtyudTOUmWViPU3OqwYob5n1EZl2c9SgJ/FNUxlT73fcKE2/F8dUJxek1Yesb
         6yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745508; x=1750350308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcrauDTgCR7Al/8FGSIBYKujeMp2EIGE7Dwwai/CuqQ=;
        b=and0LdWf0l9agqMOBFuEK3U+OEADC2anBhpHnan/BSSQPcXphUw0KJJ4AHRkm5d/Jr
         mq6JbxNFqoy91cn8hS9HfqJhJheqIz5l1brvdADUCOpMFZ0y383n/ue6HwN1nT+Gt8BD
         /1ApBuKyeobfLU9oWizf+AhcmBpGgWtb1Q5/lnEg7ufYNOTlXsER4M2faU6WNQwRosyC
         Q+ejVnnwDvIwi5iEZktSbvPeXz7fOmQZlLbRU1IUHiVqq3QZm/yxG/3PcSNnBnU0EFk0
         iF5EFqpDhmozisdTdlzgs44g8d0wYvOUMsHi/jICrB6WL8uCFQNfMGyPH7IfhbwKkVH8
         BmjA==
X-Gm-Message-State: AOJu0Yz2zIZqlSwxfOc5NHuaP3gtTn92pMhrUyrvvBp1kHZvfT0MZy5g
	S4F01y6Yep3e+be1HCqo9Gp9frgPTLwP/ZwjK455x2XedufsghVcmER9
X-Gm-Gg: ASbGncsZnfReud5iEDJ7rruaBZWG0hbGB9MSIxP/dhvGFJmDQczDpvEy5MAKUwVcW+T
	sjOTmpLvBqKoJxRdy7lZY273wg0KjwHj2PLFCU8LKnp1rKJgwWNgcJ5GBPYMDbsTNth8mj3W/Bl
	NYNgIELim/yC5fielX+YlODKwBN6VN9kMTtEySKHbNdQaeHCzmOra9M78tZdagE/78UTncoSCO0
	gc0U9+/gqRdrKVVdGCVYHQPSjgOnZLe4laFEDWY9SjUojiIGKZabvPF1PkHyTcj/tYruPWQcx6Q
	ME9XtzXjIRd2ELhNc9cxwTuh2C3HfvSCYg/xwfLOtEm+RSOw/Ubo/JZnRmplqaNvsfQ=
X-Google-Smtp-Source: AGHT+IFmqnNBw4b84BLp4mueHDgtHzNI/tmM0nog5h24GMaqwU7o2y8UATCmDGbt7GtoO2wPSITyEA==
X-Received: by 2002:a05:6214:262b:b0:6fa:f94e:6e79 with SMTP id 6a1803df08f44-6fb2c31b398mr116101846d6.9.1749745507599;
        Thu, 12 Jun 2025 09:25:07 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f72sm11996486d6.23.2025.06.12.09.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:25:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 12 Jun 2025 12:25:03 -0400
Subject: [PATCH 3/4] Avoid spuriously reading gitconfig
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-better-errors-v1-3-3aa1523f6d8e@gmail.com>
References: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
In-Reply-To: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Rather than always reading gitconfig twice in the first call to
`set_bin_paths`, do it only if necessary.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/patatt/__init__.py | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 12bf06a..b50003f 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -1010,25 +1010,21 @@ def sign_message(msgdata: bytes,
 def set_bin_paths(config: Optional[GitConfigType]) -> None:
     global GPGBIN, SSHKBIN
     if GPGBIN is None:
-        gpgcfg = get_config_from_git(r'gpg\..*')
         if config and config.get('gpg-bin'):
             _gpgbin = config.get('gpg-bin')
             assert isinstance(GPGBIN, str), 'gpg-bin must be a string'
             GPGBIN = _gpgbin
-        elif gpgcfg.get('program'):
-            _gpgbin = gpgcfg.get('program')
+        elif (_gpgbin := get_config_from_git(r'gpg\..*').get('program')) is not None:
             assert isinstance(_gpgbin, str), 'gpg program must be a string'
             GPGBIN = _gpgbin
         else:
             GPGBIN = 'gpg'
     if SSHKBIN is None:
-        sshcfg = get_config_from_git(r'gpg\..*', section='ssh')
         if config and config.get('ssh-keygen-bin'):
             _sshkbin = config.get('ssh-keygen-bin')
             assert isinstance(_sshkbin, str), 'ssh-keygen-bin must be a string'
             SSHKBIN = _sshkbin
-        elif sshcfg.get('program'):
-            _sshkbin = sshcfg.get('program')
+        elif (_sshkbin := get_config_from_git(r'gpg\..*', section='ssh').get('program')) is not None:
             assert isinstance(_sshkbin, str), 'program must be a string'
             SSHKBIN = _sshkbin
         else:

-- 
2.49.0

