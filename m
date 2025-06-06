Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B5323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239479; cv=none; b=FHfJFzJVUw9ZaFOwysoJ7jnPLuhX7fL0tkK5bVK+6QUa/p99Sd/kgRjPy42bQJHelEmPQGIOTaR7HeB056n7g9YZ6UFY7t6eP/QmMNweOiA8XvzSzIKikQ39XPhxKQkivB+F6gGYcvlzWQ/4fm0XujzXb0jbCOg25oTMV7MKoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239479; c=relaxed/simple;
	bh=LZ7m7ecxS1D0FDK3Ig0YvyfRV/jSE4CXmEMMwPhewRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QIFSge5u80cINKH1ZRFrmvsCbd1u5O2hxKE4Y/eUyZsyNlC1TerSo6470kRbldneWxnpApsbL8kvMt+I+Ew8vGpyqwrj9w2cbpK9SvMGtjd6SuRPfiSVjaP82fyH9Mrgdc+By7yOndXToapCJ5b17f1YyE7aeXOdK04gX/Vnyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8/Leq1a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8/Leq1a"
Received: by smtp.kernel.org (Postfix)
	id 3B6EDC4CEEE; Fri,  6 Jun 2025 19:51:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 493F0C4CEEF
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 493F0C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a5903bceffso29270451cf.3
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239477; x=1749844277; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBhiQxPLRFudNCDimzIaD85pqylWmkVBUSt9PRC5W+w=;
        b=I8/Leq1ayUKOAZMFL/PpYvMUUHAEjdPI/wN9rXev75u3xBgSpmR5Ve3O2kVGwcQqmy
         JW+Nn0eOZWeeuuLIrabD5uPuYTnXsBNSpIV8WEiF9p77tr+Kw1vubU4WegVkJ3Bx365f
         6K6viK9+39iCselew2BYiD01Th2yC6Qra+tMRw9vrF7H5n8HwZf149Aq1L1TSIGRbaIT
         y9CtOwunTFdYVpXHbQH6sCdnv06jmLcyNCTSYY6JNViaxJo7GusNSMnvcjHmGTddZFop
         tf+6v6BRsE8PegN56iNd1NdBv7+Szn5/+5yoGMh7EEYRv7t7MZbT6JqBUN/KjDG8GVj9
         mAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239477; x=1749844277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBhiQxPLRFudNCDimzIaD85pqylWmkVBUSt9PRC5W+w=;
        b=dVsfuaRJw5+WxzW10tWftyj/5ZnBV3Xsyj5kthv7V8RcFbj9+utyYi8aP4waqNZMlG
         jUkeq8yD+Y9Ir74dx86lzwh2P/htMOF/ewYI45FvT4iRVYE3fljV2b1vTdurQrjGdCf1
         xpZ+a7m8NIlP3cfwEpfVby0/4DsHBg7w/aMUVJ3CUsRGRoACmE1/jwBD9sI9E5Z/+Wdi
         /EKN+0fGXDs1T+4TG39YcrQ5eTqK2po5SHL0hoW43rfDgWuTcoOsZTRcwSQMQlyjBAMl
         cCcBxwkXNelSYviepFIy1R+0C1Hto/JE8aDy/RrKvDNeoUzWKcaEIBGmot3OOvWyDEpJ
         TZ1w==
X-Gm-Message-State: AOJu0YxmUz04QEvsZEsHQBSSV2+mtTQ2iRBA4GYTUxvAHUB62GgCJLYm
	M2cQdd/GvVUOBX8DkVIZh2rxHB1Ll8DvwUohC+E9nMg5Pe8MgumTzSgh7Taddi3O
X-Gm-Gg: ASbGncvug9IolXe6r5Sr4VR2mpp7ZWhAss4l4xfIDOMoxghp6YLPBbxIr6oCBPskt4P
	XviqrwR8zrZ3UaLQS7NuG8FxNNzoYZyW9fcL36NsiNTK7z0tw+bnNCoVx+zjTlG6CNYVcd4Tmnn
	Q1x2uKsKvnfN6tmyDrXZUp77ENNA+xeGoIICLXUFVdh2Oa0OmA9qOHBq6xW2t1zkAP80vL9x+Nv
	X02Fx+wzDgJvb+lN7pvu9sawaXJeCqq3YSBIwp2eP0gil23VSJsHHLu/38sU1f8+6WsW94jXt2R
	KOgvVXJsdy4Ijnhuf74CnymvnRWP50UEsxXOSkqDisX97gwOQXKSN81YAvKPthrrJQ78R0Jaew=
	=
X-Google-Smtp-Source: AGHT+IGeu2Lv7494rL/CNFjGWx93tr2CGsu4OKqYP4DxPY+UNP2807URKQMrzDN3gpLH72sNF7Rk9g==
X-Received: by 2002:a05:622a:4acd:b0:4a4:40b7:9cc with SMTP id d75a77b69052e-4a5b9a2ab3dmr77614231cf.12.1749239476992;
        Fri, 06 Jun 2025 12:51:16 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:15 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH b4 00/10] uv compatibility, typing improvements
Date: Fri, 06 Jun 2025 15:51:11 -0400
Message-Id: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9GQ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyML3dIy3eT83ILEEl2TVEMD8yRLy1TzlEQloPqCotS0zAqwWdFKSSZ
 KsbW1AMoHA1dfAAAA
X-Change-ID: 20250128-uv-compat-4e107b99e7da
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

uv[0] is an extremely fast Python package and project manager; allowing
b4 to be developed with it makes life more pleasant for all
contributors.

This series makes the b4 project compatible with `uv` and fixes various
typing problems. Please see also https://github.com/mricon/b4/issues/61
for the likely cause of many of these typing issues having previously
gone unnoticed.

Link: https://github.com/astral-sh/uv [0]
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (10):
      Use PEP-735 dependency groups
      Specify optional dependencies in pyproject.toml
      Specify dependencies in pyproject.toml
      Add ruff, remove all noqa comments
      Remove `noinspection` comments
      Add mypy
      Add missing LoreTrailer.lmsg annotation
      Check variables for None rather than exprs
      Make LoreSeries.indexes never None
      Add missing type annotations

 misc/requirements-completion.in |   1 -
 misc/send-receive.py            |   9 ++-
 pyproject.toml                  |  30 ++++++---
 requirements.in                 |   4 --
 requirements.txt                |   8 +--
 src/b4/__init__.py              | 133 ++++++++++++++++++++--------------------
 src/b4/command.py               |  34 +++++-----
 src/b4/ez.py                    |  50 +++++++--------
 src/b4/kr.py                    |   3 +-
 src/b4/mbox.py                  |   6 +-
 src/b4/ty.py                    |  17 +++--
 src/tests/conftest.py           |  17 ++---
 src/tests/test___init__.py      |  25 ++++----
 src/tests/test_ez.py            |   9 +--
 src/tests/test_mbox.py          |   7 ++-
 15 files changed, 181 insertions(+), 172 deletions(-)
---
base-commit: 6f78e874e96b0b3bac1767a1743b20af20cb0e2f
change-id: 20250128-uv-compat-4e107b99e7da

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

