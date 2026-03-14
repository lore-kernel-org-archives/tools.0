Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40E317164
	for <tools@linux.kernel.org>; Sat, 14 Mar 2026 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773462049; cv=none; b=gmh8sLSRVXM57fNrGdPkI1RKVO6dP0BJziTyccEwBaBAji2u4GidpLgM8Dy88TiX+RoXpwdssgWIipOiv1F+vcPKaD0FDG+1CS09wP7QBPnt5kp3gVhdgTLoEhNr5Ud1aVAZweKXvbOPuGuo4KXZqemLcj5zmjFdAhtOLnF8rms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773462049; c=relaxed/simple;
	bh=K/bSlFpZaGns2rkPYOLiU/2Fk2GlAZZwVtiqL/IwEpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/IrQDCCKC9B6/s7fh4bhn1FBQw0k+QFTGiXOaGvJu3MlZFwUnxjsl/Fh96pI/ng6hGOogUTXf6aViqiXKPN6a1nJWLg4AYrTeqH6AWR5uo/8vEEnWT/2WGuTTQan0XYWAuBVW6xuOBxFAHGhP8e+WWmYH8CZQ1Ixv/oyconfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTUVyTFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTUVyTFj"
Received: by smtp.kernel.org (Postfix)
	id 10FD5C2BC86; Sat, 14 Mar 2026 04:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C711DC116C6;
	Sat, 14 Mar 2026 04:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773462049;
	bh=K/bSlFpZaGns2rkPYOLiU/2Fk2GlAZZwVtiqL/IwEpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTUVyTFjIa8hf6A5eYM2INkq7Je+9TO9CxB3eq71yDOueHoInGqTjvGuEP7QXm/co
	 WqeVCCBFqdDZWpUybzekjuUKuUUYbcz/JnvKlrEU4OHDLzD3d5rm1K1Z4prYGasswM
	 fHXdBriTihWOaQcWVEPxxq2uj3D1tx9xq/5gH2q9rbSCi7KPi0HGRoxuDVEmHzOx0f
	 QMnAUh8w9S6AhysrJlfxTe4x5bz2Uq4tPu3Gw62abtU4pQYHRb0m7xQO0IhndHNNbl
	 Y9Xw+AHcGeehFU+UjBi63iDPWjL3yNTVMnXbj8mAG5OebslmCTj+RBzW4L9vdVIRcm
	 1+Zx52AcavVOg==
Date: Sat, 14 Mar 2026 00:20:47 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: range-diff hangs
Message-ID: <20260314-bouncy-lilac-mammoth-d6e6eb@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260304-courageous-deft-skylark-a16e39-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304-courageous-deft-skylark-a16e39-mkl@pengutronix.de>

On Wed, Mar 04, 2026 at 09:56:35PM +0100, Marc Kleine-Budde wrote:
> On 27.02.2026 14:53:07, Konstantin Ryabitsev wrote:
> > TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> > maintainer duties. A getting-started guide with screencasts is here:
> > https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> 
> I'm using b4 v0.12.0-419-g18f8fdb27a22 and a range diff "hangs":

> | $ git config get core.pager
> | diff-highlight | less -RFX -x1,9

I believe we should be handing the | in the core.pager config now, but please
test out the latest master to confirm.

Regards,
-- 
KR
