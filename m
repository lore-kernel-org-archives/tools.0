Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D72DC331
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115196; cv=none; b=stIJ88+7s7TueFnrPWR5qVuuGKn0aMyHgHLZl+/D+6ap8We7rUxhjGLPSNtxMgDOfDxVHr7R35F7+wOB5QGgnuq442OWBWkSDqUbrihF3LHCQlGGh4WW/mTz9a8hEpeFAZd43a3xNIFv+tD1GUWtpEqDJ6nndfulm10xqhbHpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115196; c=relaxed/simple;
	bh=MGrIGhI406EMFslLz9iNOsPng6mkpC1EsYERrWvP1LU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FyU8sLDGXmEK62+HHQDlR850Wmmmk/LzVvZvuHO2W1iORKcgKTrb+d1igpu1qyw/4DBqr5iUebUCdCcnaPqjsRmZ7PT/6GV4+h0Tnry+XtunOKmuK4oJehTwfRi3xII4VQULzQAxidaE6VIY4RLAhrY47KY7J1O5DMyLGjtXer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j812Bs5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j812Bs5I"
Received: by smtp.kernel.org (Postfix)
	id 2E26AC2BCB3; Mon, 13 Apr 2026 21:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5364C2BCAF;
	Mon, 13 Apr 2026 21:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776115196;
	bh=MGrIGhI406EMFslLz9iNOsPng6mkpC1EsYERrWvP1LU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=j812Bs5ITcvq6bOH/nbaR1tpttRESwF+KE3hkJe/7DheoHANPlTcB81itexiuJG1h
	 Xo+e7FyOCjw7p0m3YkcyD2uy5BDM9aRQM3oLDfmXe9eWCAoJxaXeWaPz+iPq8nMYse
	 dZ+Dy3EJgj/pAJALY/MrYGH0FoFvnMOkHSw1NgmA=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/14] Add b4 CI checks and mypy suppressions
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260410-harden-type-checking-v1-1-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
 <20260410-harden-type-checking-v1-1-fcf314d9d748@gmail.com>
Date: Mon, 13 Apr 2026 17:19:39 -0400
Message-Id: <177611517998.749969.8235396053359093909.b4-review@b4>
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=MGrIGhI406EMFslLz9iNOsPng6mkpC1EsYERrWvP1LU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDLvxv4oLwi1DX+eNEXVuDr338wNr/e9WFKsKzYpxv7o5
 9XXnLZ/7yhlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRiaIM/2wEmZ/PNjyzwoXf
 d+GN27zhLo89Oy+4P3Ld4buN+X26/zxGhhli0ouEbAvtHP2z37eJVm31+vBOR4hxL0dL3ow1p79
 P5wIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 10 Apr 2026 18:37:52 -0400, Tamir Duberstein <tamird@gmail.com> wrote:
> Add a repo-local b4 CI check command and helper script that runs mypy
> and pytest so review status surfaces local checks in the b4 UI.

No, this introduces a hidden vulnerability -- we're running a script 
from the same workdir with code modifications. A series that modifies 
tools/b4-ci-check.py will make the code run with permissions of the 
maintainer.

I am cognizant that this is what we do with b4 review and checkpatch, 
but I already have a fix in mind for that, plus a check that will 
specifically refuse to run a script from the workdir of the series.

-- 
KR

