Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC9139CFA
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887383; cv=none; b=d6Hn+UXF0jgf+AdAsN2dr45opi2qSoF2m4s+MooRcrRhR/4VoddPPFJdJkiKq8S1yIuNimvuJ5IYhnbvipZGKqZ9K9nWhIQhOUtXSmsKVIRv45s8X/NV3MwX4IjXlznbAbc/JZHTTepnV0R4rmhRKWGnsGwEAuSNTBTwWmWSsB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887383; c=relaxed/simple;
	bh=0OPLXBseOthSxySeIblo8zm7b1aOyJfgRSWgYMUrIHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tWSSfJwUnbNGt+kltPSNg+EDoWLzOsXEkiMsNlf6EnZycbRQ4nHqs3Ly3aJrdU2aYrciIed08E0/WmHV1HvU2jf29fysvOeY3c0wAMhTchw425BaJyTg76O5harrv2izTx4BOrOKwkFUvmVgZkyZQsVW24i7KyUiEJDfU5Qtn5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh5KMjyv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh5KMjyv"
Received: by smtp.kernel.org (Postfix)
	id 8AE1AC4CECC; Fri, 25 Oct 2024 20:16:22 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0675C4CEC3
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0675C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460ad0440ddso15190141cf.3
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887380; x=1730492180; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKy3AY+b4LfUez7JLQZMkDFV1JNLWyspGKumurvwsVg=;
        b=Bh5KMjyviBL37lpjRqkj8AMCv2mT8x/6GLbrp7UdEpOZ5UIxMGqPUoClc/4WL+zlSi
         cRl7tVZfrE+KjFyY0CT3MXaP8mXrzXJ9uHYMRzmIsaLWIF0EDl4qXHDvNLqSu39LcDJi
         us0YfPBu33kutdIaqnh2m6TH6WXg2M5f3+EM890d66xa6LXNfvRlizKGsptxw7sn2lLi
         jZ7Srp5AZT9IV98W4YsRwj+KugiNI3zQTwuHhrjX2ekS5AYuImPaqSotxnR0253tFkRz
         c0JNtxsHoysn7nue+hxlgvJZ3yW2LJivtyhRO6OhYzRJz84qIK8AqbbeS6ErIfSQwbN3
         izxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887380; x=1730492180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKy3AY+b4LfUez7JLQZMkDFV1JNLWyspGKumurvwsVg=;
        b=S1QMY7Fx2sX34X6nOpa4xr/m9dX9JI+RC7E6SHGkMO5nqpmXRJzyuNRqG7ZpHgFdUW
         NS4FpUZ3d3nytx7FekP316v+yHSqOmPW0NLdegrbbhtRWhTxsffDccQzSsTAdoqKA4he
         6kRsEAPedy/kViwgP+A8091p8fj5w59byjI94mo2sBI2gg1kilnkVKC02helsddr500q
         d+/ZDiIcu1nx0dXsedhFcmFd8fhCmQaqwMs0cRBeKQgDO68o8Gi7gxwBO2fkJu8PiHQ2
         +SewfQ1+fTTDwxo76PxPRsIN+ryg9Nf4VIF793mh7YGx9TAFadugZj6QdTXETzJcrtM8
         Rccg==
X-Gm-Message-State: AOJu0YwJeHH/l317Un4AeUdZcijE/QY/0/nJDUu1WVGnSrjzHnltPI3c
	nyjpMxTPcE0RkGpAg/glaQjzuKfibqjoteHKK9Hf72Vz5k8Kw/Rr
X-Google-Smtp-Source: AGHT+IFaJolGx6I70Jp5kHm+M1oAkPolaBbxu4/M94Wa37+2ZGcKGVwHbLqVRzwdazpJMzB+TyDNEw==
X-Received: by 2002:ac8:7c44:0:b0:461:18f2:b1dd with SMTP id d75a77b69052e-4613c0301cfmr6281481cf.27.1729887380556;
        Fri, 25 Oct 2024 13:16:20 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:20 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH b4 0/5] Resolve some static typing errors
Date: Fri, 25 Oct 2024 16:16:02 -0400
Message-Id: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIL8G2cC/x3MQQqEMAxG4atI1hPQqAheZXDR6l/NpkobZES8+
 xSXb/G9mzKSItNY3ZRwatY9lmg+Fc2biytYl9IktXRNLT17mCGxXQfYxbibs0IyY2gl+MVLCD0
 VfSQE/b3nL/mOpuf5A6DSclFtAAAA
X-Change-ID: 20241025-better-type-annotations-e732fbdb2ff5
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This series slightly improves the quality of type annotations in the
project. It also adds development dependencies so they can more easily
be installed.

Unfortunately this is only a drop in the bucket; there are still 356
errors as reported by pyright. Without minimal tooling to ensure these
don't gress, progress will be difficult.

I'd be happy to contribute such tooling, but I didn't find where to put
it - there's no obvious place from which tests are run, for example.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (5):
      Add development dependencies
      Avoid file descriptor leak
      Correctly type annotate generators
      Provide overloads for git_run_command
      Add missing imports

 pyproject.toml             |  8 ++++++-
 src/b4/__init__.py         | 52 ++++++++++++++++++++++++++++++----------------
 src/b4/diff.py             |  7 ++++---
 src/b4/ez.py               |  2 ++
 src/b4/pr.py               |  2 ++
 src/b4/ty.py               |  1 +
 src/tests/test___init__.py |  1 +
 7 files changed, 51 insertions(+), 22 deletions(-)
---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241025-better-type-annotations-e732fbdb2ff5

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

