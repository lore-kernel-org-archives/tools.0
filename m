Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D15227AC4C
	for <tools@linux.kernel.org>; Mon, 27 Apr 2026 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321266; cv=none; b=nJJChK2Xobfjo992ZX+so7k9zezusRfehdWfFUS3Kp4w3sykKo2npDuGC9VCGbVUZIxpQ6knAl3qieqMoFdRMe6BypFJk/hFWsrehhfFqT0e0gl7Gf6ILB0W3/ZgejvkJw50F+MYsRAUY74xbpAUcMul8cWMkU/hiv/MKYcO6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321266; c=relaxed/simple;
	bh=br+OfSenkTwQ9JzaGVPjALOl+P7VeuQ6vsYYzqfTCBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWIPPztGnvd8nn924kvMF6wTzN1iF5LKyamsuFkhH52YHbHuGPsEw8kTxWNFiGuczrZ3HN0TaGQ9KPe0cSbZp3F4ZYLeN1J0G+7SDx4e4Z5kQ/LzL/6TiwgOS5lrqlZYh3z+HDnANyrQYmOmsy6SOD8MAYBBPioRTS46LvO5KNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5aHJS+E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5aHJS+E"
Received: by smtp.kernel.org (Postfix)
	id BA72DC2BCB7; Mon, 27 Apr 2026 20:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D90C2BCB5
	for <tools@kernel.org>; Mon, 27 Apr 2026 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321265;
	bh=br+OfSenkTwQ9JzaGVPjALOl+P7VeuQ6vsYYzqfTCBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P5aHJS+EbSFOmHv79f9h85yn6HW3v7aRoypqJsii7Xli7bx0YuRJUQd9Mmxba5aEc
	 u6yVSxUGYcB2F1cMA5UwP6VZyvd0dEktEss0T1oaxNYq7nIVzgKGFHTznPMA2z8JSQ
	 FftceICiBaOF7FeGCRpRQeDRbHJtTkRAK9a5y05Pig5Avr5bMTxXvw2dweqQZnRvMj
	 hNbEdytk2KIN6PHMNimoXGtRSdU0KNX2iMV1HMgBx6Gsh375DDb4tMnyGAJcUBTpAp
	 LlEmeyxlrSTTCot4GsCZx2RRUmUuBpwDI1i36/gNv0MlZ93/dF4dy0VRHuYkeiOGaQ
	 HPViBaWAR1MnA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2b636b944so15014155e87.1
        for <tools@kernel.org>; Mon, 27 Apr 2026 13:21:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YxqeXkdyByffLSmL/eSGZtyxRdFy8nhxL2lN6um/OsgOZPxvpxO
	dcU2pQSuQ+i/nBzdj+tc22cqhHNMVolh7NO5gEZkpBQSM8n7mltjb2NzkMeIKRqDW+ZmKPBF4+K
	Dgh5OldP+lWDW2F2haw3oB9RO0UzevYs=
X-Received: by 2002:a05:6512:3f18:b0:5a2:c05c:1199 with SMTP id
 2adb3069b0e04-5a74640c518mr101251e87.15.1777321264356; Mon, 27 Apr 2026
 13:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-222775b987e5@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 27 Apr 2026 13:20:28 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9mQxA98JykmZrBn6CYafu-NX-5ozWPzp2WmuY+za1WQ-A@mail.gmail.com>
X-Gm-Features: AVHnY4LoJKeBJTsSbbSG7cEUSaA1MtsKwZX6RlTh2l1uRkcpE7UN1prNwFhiLZE
Message-ID: <CAJ-ks9mQxA98JykmZrBn6CYafu-NX-5ozWPzp2WmuY+za1WQ-A@mail.gmail.com>
Subject: Re: [PATCH ezgb 0/6] Harden local CI checks
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 12:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Add a local CI script for ezgb and grow it from the checks that
> already pass to stricter formatting and type checking.
>
> The series removes stale pytest async configuration, adds Ruff
> formatting, mypy, pyright, and ty to local CI, and documents the
> uv-based development workflow.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Hi Konstantin, any interest in this series? I'm happy to make changes if ne=
eded.

Cheers.
Tamir
