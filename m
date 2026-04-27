Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63B2E2DF2
	for <tools@linux.kernel.org>; Mon, 27 Apr 2026 20:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321253; cv=none; b=jMtQ3+WibJqGGckAs/qfqfP0J8rd6ZMjf4+rzc5wTAq4+0pQQHVdX8KujQ5er4iG7Qu0wHoMBLPlFp7Aojwplajc95vD4MABUmwsCd+Lj9gyblYewwIud6C18jqhkuImXTXY2zJtG+s+KSdFuNX5KSOTKzh9vTAn4uv1kbWjFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321253; c=relaxed/simple;
	bh=Nj9B8TR2KUUog7m4/BkypUbETFEcpQA5dSdjAXI83Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYxa0OVTUXO117tXTXdOadoiGT5+f0/21NOa5oJd510CSEP8yP50gGC/O4a5dIekedfab5S520c9I8PglzkduO8xf7hV9WKZn4prsiz4EsDfIeSfN1dVJ1PPUbn02nbK9xmVv50L0HPH6CaUDC/mTz/JCopTECIUrt1mmbU2MKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKLiwvwj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKLiwvwj"
Received: by smtp.kernel.org (Postfix)
	id E833DC2BCB7; Mon, 27 Apr 2026 20:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0968C2BCB5
	for <tools@kernel.org>; Mon, 27 Apr 2026 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321252;
	bh=Nj9B8TR2KUUog7m4/BkypUbETFEcpQA5dSdjAXI83Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZKLiwvwjvgULZ/dN47j8FmWtxC4/63VuFGNOyh8sTLkRkhJMBwhEqZqhPDgt8jJfn
	 XiWgfcObn5A22v6r9ncTdfabHwJJRj7Ti9DpTiH3y5DOR230+e8sJ9HSL1fuN0veBj
	 A/LP5B7laJfKrMIwqEtCtNRCCpklEnRMGroXs3taSdfeQlCVInnG3YNrCI3YOGRIs1
	 uFkxvVdPeaS9EP9Rk79THZ6GjCpJqiF3JUajmQerO5822eEab132DV49lNa56AeGtv
	 27rioWuymvVu4pgANhclKPcqW/kbzERNVNwVp8Tpn9AWB4kBeCKXJiVS4+UlMKuzHT
	 x+TCf7Y92a5/Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so13193265e87.1
        for <tools@kernel.org>; Mon, 27 Apr 2026 13:20:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9RRg1dRvKYzNs8+Yk73O54egKR8VOdPCGy4BLi8oc1SoKb/9+
	D8UNbU6NbergOnOlhKplyQO4iRxGKgEYfP6wI0kytRUO2Ij+y9A05Rjd5GDR5Idz6eKm6C8OyJC
	4Gl4ewScYb17HfYFeq4hHc6e9JQxWmC0=
X-Received: by 2002:a05:6512:1116:b0:5a2:abc3:eaa8 with SMTP id
 2adb3069b0e04-5a74662aebcmr91223e87.41.1777321251521; Mon, 27 Apr 2026
 13:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
In-Reply-To: <20260419-stronger-type-checking-v1-0-5c108048d2c7@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 27 Apr 2026 13:20:15 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9m-VQ1qFXJu0k=Y64pQzQhq0fFb-gXg6+WNMx_=4ue1BQ@mail.gmail.com>
X-Gm-Features: AVHnY4ITDWtnAZe9390MFEKTZzsAH9mGZZLx4HQTajmJcKv4Xq1MguNNxcRm03Q
Message-ID: <CAJ-ks9m-VQ1qFXJu0k=Y64pQzQhq0fFb-gXg6+WNMx_=4ue1BQ@mail.gmail.com>
Subject: Re: [PATCH patatt 0/7] Harden local checks
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 9:22=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This series adds a local CI helper and raises patatt's local quality
> baseline incrementally while keeping the tree green after each step.
>
> It starts with the checks that already pass, then adds Ruff import and
> format enforcement, strict pyright, and ty. The later patches make the
> small typing and cleanup changes needed for the stricter checkers, and
> remove stale optional-dependency handling for PyNaCl.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Hi Konstantin, any interest in this series? I'm happy to make changes if ne=
eded.

Cheers.
Tamir
