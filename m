Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDE10A1F
	for <tools@linux.kernel.org>; Tue, 13 Feb 2024 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707850615; cv=none; b=J+ycwrprvYEyWFshlw4gdP5TW3yCE4uKNRqJ6hBgnC0ewgtVLGpOzHmqDxy36PsJqOxMLpQk9dAmMcT5aa8lnjYNkDC8MNN1e5Xq7CGU5bn5ym1AbDMMrNuzNBFlaoQg4Gyynk65aCDyccFLiT9k9iAhBZcin1VEiHbicK0JLJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707850615; c=relaxed/simple;
	bh=Y7CSAj1tiCsykFqbk9RDrDlUTtjuOqHjAPuXJTVt1aQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l+qF6DJA/58/5L24HmvY88eE5bBvhkUbF7Vf19oSO44sXy96Hi3HFlolt61nI+gy/fGg/e4WvoB+uYrA+tct9yVP7A+6zXlFKTbDl17u+EQnJ7IqlUUgT1Tpj8YVvOKoFGn9yDLfDe71xWVcn5om+rWHPTYuZunomZa4DVJ4xNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LHMHv5sm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LHMHv5sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08BAC433F1;
	Tue, 13 Feb 2024 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707850615;
	bh=Y7CSAj1tiCsykFqbk9RDrDlUTtjuOqHjAPuXJTVt1aQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LHMHv5smkNj+5Vzbvyqq4Zo+cKIke3NHrbBDVTFbBO8NJqmCMh3oUGW8it1X1vu2v
	 6TuWU6HYEdA98uBXxI3QgYW3lj3Crvw6MWtchCxxAEdKk1FMPE8tmbLn7tWkT6f1Dy
	 KEoc2tEhR5uh22ux52rRh4s+xnvXSjBWMNtL1itg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20240210-ez-merge-base-no-fork-point-v1-1-b3f82cdd3bee@gmail.com>
References: <20240210-ez-merge-base-no-fork-point-v1-1-b3f82cdd3bee@gmail.com>
Subject: Re: [PATCH b4] ez: fall back to regular merge-base if --fork-point
 mode fails
Message-Id: <170785061487.20709.12182053643177607778.b4-ty@linuxfoundation.org>
Date: Tue, 13 Feb 2024 13:56:54 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-b7ccd


On Sat, 10 Feb 2024 16:18:16 -0500, Philippe Blain wrote:
> If the 'git merge-base --fork-point' invocation in
> ez::get_base_forkpoint fails and returns nothing, we abort, saying
> basebranch and mybranch have no common ancestors.
> 
> Depending on how the current branch was created, and the state of the
> branch's reflog, it is possible for this invocation to fail even if the
> current branch and the chosen base branch do share a common ancestor,
> for reasons expplained in git-merge-base(1) [1].
> 
> [...]

Applied, thanks!

[1/1] ez: fall back to regular merge-base if --fork-point mode fails
      commit: b7ccd0f51896e38b995fe0e36f2388f65535593c

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

