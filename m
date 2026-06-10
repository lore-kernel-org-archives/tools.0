Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A818A92F
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058028; cv=none; b=nmuUubVDw0JQXRc2N0uwVuvaYWBa6KMWtsw/xCnpRXbZoPp7cPkgHeFLBFMN7t/hrtbruJhfHp3WIVxBIxezKiwnEIiOT15xwEQ30IMIeOWaCrSJ68sEt4Bqhz8bQOtf1ci9Y/4JfV+BGChIYcqeEYRW7+/rEdPQthmYOqQ59SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058028; c=relaxed/simple;
	bh=PvsdGRhs1gC5Nhvl05cLuKs17BqNkCEMpt3kbtaM1E8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kAGkl3Oa5ERsC5KDRBJDoFXfBG+BGnDe8ypVUUL5lqhJzKq2PtdLRlj2JXyFFcNiVncHrlUxSd9x/XG9k5g7P5JjfYy7xRRM2PuoO4s3exNUiqvnt3SdRSPdjRgSNr8KoK60GLR7KbeQyBQnou1TXeXFQa7ZcY6iqGBCfXyVCnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ztCgcVHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ztCgcVHk"
Received: by smtp.kernel.org (Postfix)
	id CD4881F00898; Wed, 10 Jun 2026 02:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B301F00893;
	Wed, 10 Jun 2026 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781058026;
	bh=Z0FnrTjk8Pk0q6rLkPO/HVwrdU/GDeFiQ5GM67OepMM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ztCgcVHkiNxyN+jMYjnXg3MRfBE8M8uBNS7GAErVTQSleGYysmH9v3se2rf8ScO1x
	 gh/kT+LoGphJGW6uWEFno9fpddWYgAIak3rzaxN+PR0mN46nHMPhCTbW5/XwU9oD44
	 pJwwR04fENP+DrgpzJFC3H5m7RCHYORnxDThyABU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH b4] ez: avoid duplicate signatures on resend
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com>
References: <20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com>
Date: Wed, 10 Jun 2026 02:20:22 +0000
Message-Id: <178105802269.171297.16359053180453686328.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2611;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=PvsdGRhs1gC5Nhvl05cLuKs17BqNkCEMpt3kbtaM1E8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0Tr40eZXpbOG/f4qJV+NslS+dKxxXqW18tnl9fsEhf
 +sbJt3iHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZSc5Xhn+15G+VFH/c9iQ+y
 uy6eaZHh932nsv6ZvcdWy/07KFvyPYThn+bPyYnXQ+Qdtv2MONjTN2vTP79UCfmu212frVUb/Sw
 0uAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Mon, 25 May 2026 01:14:23 -0300, Cássio Gabriel <cassiogabrielcontato@gmail.com> wrote:
> diff --git a/src/b4/ez.py b/src/b4/ez.py
> index 3e81138..4f55f0f 100644
> --- a/src/b4/ez.py
> +++ b/src/b4/ez.py
> @@ -1734,6 +1734,15 @@ def get_cover_subject_body(cover: str) -> Tuple[b4.LoreSubject, str]:
>      return lsubject, cbody
>  
>  
> +def strip_cover_signature(cbody: str) -> str:
> +    body = cbody.replace('\r', '').rstrip('\n')
> +    sigpos = max(body.rfind('\n-- \n'), body.rfind('\n--\n'))
> +    if sigpos >= 0:
> +        return body[:sigpos].rstrip('\n')
> +
> +    return body

No, you should drop the '\n--\n' (bare, no trailing space) case from
the sigpos search. The canonical email signature delimiter is '\n-- \n'
— that trailing space is load-bearing and intentional and we
deliberately only recognise the canonical form, and for good reason:
bare '--' appears legitimately in cover letter prose — markdown
horizontal rules, CLI flag documentation, SQL comments, and various
other contexts.  Matching it here can silently truncate the cover body
in ways the author would never expect, and the conservative posture of
the existing code is the right one. If someone's cover carries '\n--\n'
from a non-conformant mailer, a doubled footer on resend is a far
smaller problem than silently eating half the cover text.

With the bare '--' case removed the sigpos line simplifies to:

    sigpos = body.rfind('\n-- \n')

and the '--' parametrize case in the test should be removed too.

This is the right fix for the resend path. The previous cbody.strip()
also stripped leading whitespace, which this helper does not -- a minor
behaviour change worth looking out for in case it wasn't intentional.

>
> diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
> index 3d05ef9..5abfea2 100644
> --- a/src/tests/test_ez.py
> +++ b/src/tests/test_ez.py
> @@ -408,3 +408,24 @@ def test_store_cover_preserves_series_notes(prepdir_commit: str) -> None:
> [ ... skip 18 lines ... ]
> +        'Cover text.\n\n'
> +        '---\n'
> +        'base-commit: abc123\n'
> +        'change-id: 20260101-test-change-id\n\n'
> +        'Best regards,'
> +    )

The '-- ' parametrize case is correct and should be kept. The '--' case
should be removed along with the bare-delimiter matching in the helper itself.
Optionally, adding a no-signature case would lock in that the function returns
the body unchanged (modulo trailing-newline normalization) when no delimiter
is present.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
