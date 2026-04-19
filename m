Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDBB26F29C
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622035; cv=none; b=nDoyVbCVjCBai6T8xffdtLqcovQEVGlf94OJAMBYvtZlPRb2AmDFAH3intaRHAVLednJXbU4XHcrq0qSYfaIRKV7hsWdxlUuXN0CppSIrgmC2StV8EZ6MCmPpcKJZZ/xE1PosR7MWI/ioz7u6jUyXxNLFUOP5v9CSjluzPIboF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622035; c=relaxed/simple;
	bh=urV1FQgnFegQ7SOKuePehMDRPRM+BNpDrlPsxWCKeeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=oc7YJGuGkXG8/1FbKXDzXj54YbdwHIfjT86NWFjRUcOBIXBUGvdZ9Zlida4fjRv/FzNrWTSFPPalcjBQMqmvqf96yIiWunm+CrBZ7G9B4xj2zEtc7jbYw8VG7wWsu5rV2N/emkDxSJ5AH2SRffoF/ITXa6ZuyQvBguS1QZrwNrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/Ar3snM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/Ar3snM"
Received: by smtp.kernel.org (Postfix)
	id DB400C2BCB6; Sun, 19 Apr 2026 18:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AB7C2BCAF
	for <tools@kernel.org>; Sun, 19 Apr 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776622034;
	bh=urV1FQgnFegQ7SOKuePehMDRPRM+BNpDrlPsxWCKeeg=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=r/Ar3snMkZito4VEOm860GtQz42/Y+7DzeqXi7nbQ2i4bUeG6QVjqjKUT4nZ7beH+
	 MJpUZl8aNJQLfoi1joiaugf8A14up1B8VdmdqsXgpQsHLBtYfiUseTUIu1dI0qWMpd
	 llF2a1O6Yif0+QDoSwqa1wJj/8k2zKUxRwSglhS/cWnbYpyppFm309sQ5z84321aMR
	 MpQJvTL19+wxRIXeJLVMHamlf5Htx+p4DUqoa+9lvVGyD1iOJV9L6981NCPBO/aaa4
	 kYab3xU8L99Uc9JmV13Ex8kjZKkuJUqgelFpfTg1CY21GOCa/GzzlHQxEEtybdhZj5
	 CvGc55rGtZ3qg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2303255e87.3
        for <tools@kernel.org>; Sun, 19 Apr 2026 11:07:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwXhdnMrqt4t8e9D7PIhGTTg9c0y5oNVedfsFOxXIxPVDAqJvyY
	M1f6C7PtQeCka3nBzcbbFECpV/M3lFUXl4IXUkamn61VljbxoqT6MyFMeqH4HTeru0qqlN6udiK
	cZkpz/qGJte7xIp0vZ8VRR3eNv4ut2w8=
X-Received: by 2002:a05:6512:3d27:b0:5a2:b219:3eb3 with SMTP id
 2adb3069b0e04-5a417308f0bmr3645384e87.41.1776622033437; Sun, 19 Apr 2026
 11:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org> <20260419-ruff-check-v2-4-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-4-089dfb264501@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 14:06:37 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nC3KEfw4c1D_yLJxH67p0FEKKVu8125Y-R-6XRJi4J9g@mail.gmail.com>
X-Gm-Features: AQROBzBxZnyMDe_28emh35H3ntSG9dBsZvIaG4nSMy8WGHXp5RE4pUauTaroFaw
Message-ID: <CAJ-ks9nC3KEfw4c1D_yLJxH67p0FEKKVu8125Y-R-6XRJi4J9g@mail.gmail.com>
Subject: Re: [PATCH b4 v2 04/11] Add ruff format check to CI
To: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:00=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Enable ruff format checking in the b4 CI script and configure Ruff's
> formatter in pyproject.toml.
>
> Apply a one-time repo-wide format pass so the new check enforces the
> current style without leaving the branch permanently red.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

This patch suggests a bug in B4; looks like it took some emails from
the patch body and put them in the cc line.
