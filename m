Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD23EFD30
	for <tools@linux.kernel.org>; Tue, 14 Apr 2026 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776187725; cv=none; b=nWF8fLr9DweBKBGED8b86wBiG1y2McFxJvoFqeD94o6+ZrvGt/gTFcSDLu7jDwGFVhwepTw+wFWuMCnf2DTODl3Y6TlK6Bs/vt+26QeCqViRdP0niBGVmvIcyNh2NCTTZ7bqfRLUxtsOiToV1qtNlbbgs6ohm2rmG9njLTGpwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776187725; c=relaxed/simple;
	bh=GEV8ew8AfCnruTkvh4KkxRCf/AqCW1IL5JbHl4L5orI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ln2aiTAsmF+TkVe24IXZiYyxMJcT4Kckdy+s4/S0hhjSAO9XtL0wKy/5A2Z5IabtYzrKKZl6criVSYONDYMqzbdiE3AZwLHJQu3P2EOePven3xpu9QvaUQ74IXLvKn/7HvROOzDDCfqmELGTl3w36xswKEK7N9DhslX8Gtx+NoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dKH0SqHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dKH0SqHO"
Received: by smtp.kernel.org (Postfix)
	id 9DD64C2BCB5; Tue, 14 Apr 2026 17:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5856EC19425;
	Tue, 14 Apr 2026 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776187724;
	bh=GEV8ew8AfCnruTkvh4KkxRCf/AqCW1IL5JbHl4L5orI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dKH0SqHOSUlugqwxYLdXNItzkxiJfH3yszKhbRHix0TvfC5Y4acK19N2C/s8kXU/8
	 7SEvYdkGkyEPIXJskLMK/mGBC+TULQhq5ZDGePQFJwUHsaPXdvBUTf3f0KXpKSIfv6
	 Mg9KsijOyB6w8O3oLgZTYs37jf3k7hWplehjbmPE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
Subject: Re: [PATCH v2 00/14] Harden local type checking and test mocking
Message-Id: <177618771367.847180.16159053169602920819.b4-ty@b4>
Date: Tue, 14 Apr 2026 13:28:33 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-a6448
X-Developer-Signature: v=1; a=openpgp-sha256; l=2624;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=+KDW6g8ex227xC6+/tYuARhxKChqwlKCM+BCrQN8aT8=;
 b=kA0DAAoWtsQc41ZkmWwByyZiAGneeUuh2ILjoC7LIvl/hyaNrc2Rvo19Wb0Pig6dEkj0lnmqb
 Ih1BAAWCgAdFiEEdr5dslJx4UgeZ4w1tsQc41ZkmWwFAmneeUsACgkQtsQc41ZkmWxRwQEAnhBg
 NFPvkSMiz9aubQqnNFHeHp6XasVzugSjvs05M+wBANRqKwHakNWayI/9Ha9+wMOeQ3rPZ1Ulpod
 z8kbY7qAH
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 13 Apr 2026 18:08:14 -0400, Tamir Duberstein wrote:
> Harden local type checking and test mocking
> 
> This series raises the local quality floor by making the type-checking
> tooling stricter and by removing test patterns that rely on unsafe or
> poorly typed mocks.
> 
> It starts by wiring the repository into b4 CI checks, then adds ruff,
> pyright, and ty so the same checks run consistently in one place. After
> that, it removes suppressions incrementally by making the code and tests
> more explicit and better typed: typed keyword forwarding in
> from_git_config, a typed authheaders integration, and test-local
> subclasses instead of method reassignment.
> 
> [...]

Applied, thanks!

[01/14] Add ci script and mypy suppressions
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=828e718aa0a4
[02/14] Type make_msg and drop test suppressions
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=b2981347f362
[03/14] Add ruff import checks to b4 CI
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=ac6e2df890e8
[04/14] Add ruff format check to CI
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=100116fefeef
[05/14] Add pyright strict checks to CI
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=6109a737d052
[06/14] Replace HTTP session mocks with responses
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=5445b53cd074
[07/14] Add ty checks to CI
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=7cd032b465fc
[08/14] Drop redundant read-only property test
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=53041a41e451
[09/14] Type from_git_config keyword arguments
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=18603217b450
[10/14] Add authheaders stub and typed callable
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=c9e8cf46e133
[11/14] Replace batch mocks with subclasses
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=bdca5ed2752e
[12/14] Use CompletedProcess in git config tests
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=f993dde25931
[13/14] Update README for uv-based dev checks
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=204122fd6ad6
[14/14] Add b4 send configuration
        https://git.kernel.org/pub/scm/utils/liblore/liblore.git/commit/?id=9ba4ddb7e4aa

Best regards,
-- 
KR


