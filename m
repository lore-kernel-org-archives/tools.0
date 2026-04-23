Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901329D27A
	for <tools@linux.kernel.org>; Thu, 23 Apr 2026 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776912507; cv=none; b=RENmk7mdil+PLK6UeBkRnA6gEVviTgj91nvGtRllpkAetrmRbfO7SNdV9nQpOtVRM7Q2u9O5ZfGgwVHk5rdDzaDx0IokSOsJ2onDQsiGCSu1atCYjZsbxYTXMdJo9kzJBYa8X32STQSsxiRegTanx32BzV5AWSclX5u1RkzJkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776912507; c=relaxed/simple;
	bh=IX3+cHixQbhBpxRCdEsOUvpkRgyZQIAr3gPZFSsgQl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BYxPfyPFChpPkEj4ZatsETaPlEs5v110w6d99jG8+WcICsoX3Vj7naNZHN7cO4AEqWl7Clwu4rTuJqmxQgN8pF8xXzME9e7Ieluls5hej4Ty+1ENAcq5KeJB6q4bsn10TkdSzq60GSkSs1Rat+eMQ+razy9uSjM3VRSW9mv9h4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EkW5wURx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EkW5wURx"
Received: by smtp.kernel.org (Postfix)
	id 1812AC2BCC6; Thu, 23 Apr 2026 02:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9BEC19425;
	Thu, 23 Apr 2026 02:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776912507;
	bh=IX3+cHixQbhBpxRCdEsOUvpkRgyZQIAr3gPZFSsgQl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EkW5wURxY5TkLVD/yeqEeOwFy7oQm2/vdPuWEZCRreOTJ9PHeI2gmLkaM2wnD4+2G
	 ujbJAbqgTiwPm+BZ3cqD3I/rlR0rxLHPmSDshHmlsrRPHdAMF0v9Adi3eu6uEPQxJX
	 ynvQ9zfQ3rqnLBgAeKPwZvDvqnsJHouS2tczoV9E=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: "str = 'reply"@example.com', "str = 'reviewer"@example.com', 
 "str = 'author"@example.com', "str = 'patch1"@example.com'
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
Subject: Re: [PATCH b4 v2 00/11] Enable stricter local checks
Message-Id: <177691250092.2224433.2009633315510519367.b4-ty@b4>
Date: Wed, 22 Apr 2026 22:48:20 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=i0A/vXWTvhhojQ3o4buXeYpTsysZQxo+NGUbAcJguY4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJfdlS2/pi6bt7cOX8dpBd8vZjFdMEoWXPZyqfb5NdXq
 sYreiXe7ShlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRT28YGSbttJY79+2Hjc8p
 b4ZDHnbrHh9efar7Ne/rO9Y/krnOLkhnZHge9/FSQPesiK7yimknahX+Wr3XUykxDhJkFpKX/39
 WlQMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Sun, 19 Apr 2026 11:59:55 -0400, Tamir Duberstein wrote:
> Enable stricter local checks
> 
> This series makes b4 local developer checks enforceable from the
> review TUI and makes the repo clean under ruff, mypy, pyright, and ty.
> 
> The early patches set ruff formatting and import behavior, make the
> test environment reproducible under uv, and type the misc helpers enough
> for whole-repo mypy. The middle patches tighten mypy and pyright, then
> add ty with all rules enabled and bump the Python requirement to 3.11
> because the code already uses 3.11-only syntax.
> 
> [...]

Applied, thanks!

[01/11] Add CI script
        commit: a08a591943b0d1f18d6590242fab649ac62616e7
[02/11] Add ruff checks to CI
        commit: 07fa553598c68805f3bb023903fc4f16d64a4f54
[03/11] Import dependencies unconditionally
        commit: 24faa874f9f245484a62c29d0094f251396d93cd
[04/11] Add ruff format check to CI
        commit: 0a0a42f6166f287f986f483502a1ef3a06ebc18d
[05/11] Fix tests under uv with complex git config
        commit: 9231a4ebe52d35fc42ea5f71a6551d79cf7f51c8
[06/11] Fix typings in misc/
        commit: 04c3e2a781b7e557d9be4525eaef5523d1ba35cf
[07/11] Enable mypy unreachable warnings
        commit: 6de7cb316dc3a8cbcaa5547930d0c5b97bb46789
[08/11] Enable and fix pyright diagnostics
        commit: c61f5cb97b461c90732c47130471e72cae069aa7
[09/11] Avoid duplicate map lookups
        commit: badbf476853eefe57c4f51593c1483a937428aee
[10/11] Add ty and configuration
        commit: b150595b630814ba95c1178319dfa5f46730adb1
[11/11] Enable pyright strict mode
        commit: 9186f8a042abb29c90db79fc70967d0d88236d10

Best regards,
-- 
KR


