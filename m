Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C84A39A055
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118102; cv=none; b=GN1m478X4411q/9Q+ty9qSNuBZiEauEjDalu2ujsm+ujExs7RQejqYNWnVZau88GFnpJVsLnlArKRfLYHeoLUCVuLtVjQt/tBNcaFEXNKnqFDYJaYaAYXLF3MR9RiAIMTeaV3ST5ECR3AjTvfxbmC3jqY8xli/mmNqUKexB3lds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118102; c=relaxed/simple;
	bh=c+qAYqCwX+waRpE2PlBlBdjM3Ih59kJd5GE/ctERXzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e3tsDeLenw0HxDFiwHNP8VPUTK7OfrDDMF6r5xb/aTxADnXsAuiTlM0ZgZ9YwaK72I6gY/3114tDO+ST9J1Cl60otizVhzP0kHEER7OXJDlNgKul5FnNlqA6YM2FHq996wftvhdi2qFn3PoUsCwfGWcfCDbsfItxIS8pJtiT0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBvvuu3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBvvuu3e"
Received: by smtp.kernel.org (Postfix)
	id 51A8CC2BCB3; Mon, 13 Apr 2026 22:08:22 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 619C4C2BCAF
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 619C4C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc085395fso472653385a.2
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118100; x=1776722900; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LH4xB+NOiqSft7Cvv+8c2C1ihpKu9D2rWhj6Bd4gaEM=;
        b=qBvvuu3e0bktjrHuadEPcbOglV4FJge1ssSoJZz4IyhX9Hvp5GRqD1lCO9ykbVKCKl
         cWXtHbYjq/+8guuhT2OUCvGrs8I43ZLg3GJfhtRZXUZVxXRG3jVvt3ogc59tF/4pFs8F
         laBZtEIghMgnX3dvEFNzTi+0Wn/pgWBqLoqJ7cyQswmUJaq99EHiqnCSpiNWBvhpVAjt
         M4QPaEYbNLgfsOpJNMPsD0PasVzRX3c9rhGx2SW5xzZl1GgiZ/s5UBfp8oxtyYh6OMGI
         glOPUv5dkqlFZNdGdRqrIHXL7jRXzucSGEhNjCgrqzjOuDLyF6ynzZbGwFW4Dx6FRXsN
         e19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118100; x=1776722900;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH4xB+NOiqSft7Cvv+8c2C1ihpKu9D2rWhj6Bd4gaEM=;
        b=DXJJ24LBMcb2JV47sTzWWrxRAVu4EHrJ0TY7ffItO9GId8d5tpR6OcqMwA2B0V3tqf
         d8rvCjGaTwiBNYkITFsDf8Nsbk3IxScg0PoOASYHQIQfVlKhH2h38L/dIzU85wwh6D2X
         7P4daKf76HLcKmeFJkDDgeNJMarVT83A1I+PkFfErHPclx73nkRJXmvY3fYvB58Seo4G
         xghQWmjYPFtQWe2P3ZjgxwVM/9eBTy7GVY49Xfmx+bDbMLD9x6ewgVLFHKU1rznUHmNy
         KoNUsxqE81a1ZAcwmhSaSCeCF+ItGQ8ChpFZaSZhlT+wz6Ixc9deenixFxupJIq/eB9Y
         54yg==
X-Gm-Message-State: AOJu0Yye4++ukZRLvpbQEv4ZmcZFiAFmTRNshR0LKQbPPOo+pTEevTds
	UL5x9ekWyDfxlylQpu99NQB7NJWTAbiATSbN4GAlTrpgyytWvxcn1Lwn
X-Gm-Gg: AeBDietyLolQpuCZAJnvVwLIqA2toG7+wTUIzken5nW7sqAG+IrflkvwwQATwtXGO3y
	ohAJPUzSOG4z626nRS/VAg6YdKAAVfqpGH0cyrNAATSrTyVZJdHolgYz1SF3hdLUyB9lYSErGIL
	x950DlhgCLLKsTPDaWQfDhqk7qbLEN1OT8FOQvpwN3gqdEPevgihy2gx6rDenFmKZqxGPR2nNd7
	GGfBdBkTmCZIWKwKY77yUlbZXRbWttawVWVm9PEBLSp8fpCPd+nAGBIsdPIwSf0tgwyP8lY0MS8
	tiVlp0WTFf+P8zTSInDz2G0O6jzt0bFYLhgCb1/NlLi0YxxcMYXQHfjrKFHyuFdFdXpemwWiXYH
	XMx1ETZWrcXxx1uEQ4VOeWEwy2Bx81tCuJGjwNOS0RF5FDtUcBMkxovES/jlTYf0bT/w8DAQDbx
	plnL4E8/IU3xTdcNSJHpV68GHhCwwE/cJduXwtF6xPjYX2d4xFm+sju+KrRKSVGE0GvbAcX6oqe
	Xn5DkgqQfyFkRtb56ARlNNfPlm02vszLwujD58eRKqN2TxmmC2XqHS9WHQlELNjaaVyjYnRJ3qa
	BVRn+4AqUQgMHgNyc+uCpPzR4zbolcax/iFbw7ylHEe1/Yn24EzwmmEaOxxZlCQ+nXMau3/8TIg
	=
X-Received: by 2002:a05:620a:4109:b0:8cf:f215:24c6 with SMTP id af79cd13be357-8ddcd8f7171mr2206000785a.21.1776118100288;
        Mon, 13 Apr 2026 15:08:20 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2 00/14] Harden local type checking and test mocking
Date: Mon, 13 Apr 2026 18:08:14 -0400
Message-Id: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0JmbU1bGwVX3sOwKNOBjkohLRIJ4
 e4CHsDlS95/f4ZEkSnBNZsh0siJu7CCPmSA3oaGBLuVQUt9lkZJ4W10FMQw9STQEz45NIIKTS6
 vDFpUsE77SDV/9uy9/HF6Vw/CYWtthuc0dHHaf0e1eX8uRiWkqLE+KeMKdzH5rWktv47YtVAuy
 /IFHBh9fMoAAAA=
X-Change-ID: 20260410-harden-type-checking-e92ed8b4cac1
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118097; l=2980;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=c+qAYqCwX+waRpE2PlBlBdjM3Ih59kJd5GE/ctERXzk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAonyCQA4yhn8+7+/TQea7K2HfQgFfT/XSydiFCmu17J+wVUNj/cHpJ+vg2q2YA7nje15+1hQ3N
 FegtEqpDfiw0=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This series raises the local quality floor by making the type-checking
tooling stricter and by removing test patterns that rely on unsafe or
poorly typed mocks.

It starts by wiring the repository into b4 CI checks, then adds ruff,
pyright, and ty so the same checks run consistently in one place. After
that, it removes suppressions incrementally by making the code and tests
more explicit and better typed: typed keyword forwarding in
from_git_config, a typed authheaders integration, and test-local
subclasses instead of method reassignment.

The goal is to keep each change reviewable on its own while moving the
tree toward a stricter baseline with fewer exceptions and less fragile
mocking.

It would be nice to reduce or remove the use of `patch` entirely, but
this series stops short of that since it would require significant
restructuring.

The final commit adds the minimal b4 configuration needed to send this
series. :)

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Replace b4 CI integration with simple shell script.
- Fix placement of test docstrings.
- Fix `from_git_config(cache_dir=None)`.
- Add missing spaces in README.md.
- Fix b4 send-prefixes.
- Link to v1: https://patch.msgid.link/20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com

---
Tamir Duberstein (14):
      Add ci script and mypy suppressions
      Type make_msg and drop test suppressions
      Add ruff import checks to b4 CI
      Add ruff format check to CI
      Add pyright strict checks to CI
      Replace HTTP session mocks with responses
      Add ty checks to CI
      Drop redundant read-only property test
      Type from_git_config keyword arguments
      Add authheaders stub and typed callable
      Replace batch mocks with subclasses
      Use CompletedProcess in git config tests
      Update README for uv-based dev checks
      Add b4 send configuration

 .b4-config                       |    7 +
 README.md                        |   11 +-
 ci.sh                            |   10 +
 pyproject.toml                   |   25 +-
 src/liblore/__init__.py          |    2 +-
 src/liblore/node.py              |  104 +-
 src/liblore/utils.py             |   89 +-
 tests/conftest.py                |   90 +-
 tests/test_auth_headers.py       |   83 +-
 tests/test_cache.py              |  214 ++--
 tests/test_email_utils.py        |   63 +-
 tests/test_formatting.py         |  324 +++---
 tests/test_mbox.py               |    7 +-
 tests/test_message.py            |   11 +-
 tests/test_node.py               | 1999 +++++++++++++++++++++-----------------
 tests/test_thread.py             |   35 +-
 typings/authheaders/__init__.pyi |   13 +
 17 files changed, 1809 insertions(+), 1278 deletions(-)
---
base-commit: 1c0b653bdb6eeb95625e99419d4b34d31cb55c99
change-id: 20260410-harden-type-checking-e92ed8b4cac1

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

