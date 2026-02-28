Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F104A2E39
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300082; cv=none; b=azFr358RwL1HbdygktbteTfig7Y/PujjTJH0gPKBegPgvB5eB/q3BWg0jilU8E2YCOoDazk3xy39kYzpYj5i6unmRyQHmyOLmMDaHWWLxPPMK4Mu8cS8TuYBhj5ZPu3U3JMuv9zM/Y2bCXiqPzWSYd9r/keucp+s/5L/PoZQUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300082; c=relaxed/simple;
	bh=dMFFVbhXsO0fAJP7XPN2fQC90In2HhXgpvTlDpARzOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFJqwKj8iMXcR7PmQ6ij7UcU/1M2vCC340mY+H6anBJR4thkustb6/uoz8eBkEGzPyqAbJ14/DqaGFDHXhUYhbbFeq9LSIo+g9Xeix3ZJpUnVIzBBCMiJCH8wau+rHyZQNDSbFsbGsDb1YsP2NdL0Cvzxhsb6zUcNHm1nrHzpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIE021m0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIE021m0"
Received: by smtp.kernel.org (Postfix)
	id B46F4C19425; Sat, 28 Feb 2026 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CD3C19423;
	Sat, 28 Feb 2026 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772300081;
	bh=dMFFVbhXsO0fAJP7XPN2fQC90In2HhXgpvTlDpARzOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIE021m0KpSplx4zO13K5pTvW5ZAKctnhxIYwzuzf0BnqxPDetEmH3QKH6v+ioLSM
	 oYS/w6+vsx9tCOrVci6F/0efrxRQ1jZja340OpIz3RiyBOkM7NTMdMtvk2iFCadMD4
	 6/wnAqKf3Py95qGCSNFTtSixpywAwkL5D3HQyLK/yhG3+vPwVlQC4vnsOhhN/MMKcP
	 SHS5IIE+q0Ygrsdz3+wB/DQnnoQwFVuLmidRCFEcbNqsFRJ/AWkEV5jqqyOU8WfUGL
	 kg1ng7UM+v+TaClKBzFXtTyuC+JRkuQVAgBXnnM1/WzKkCJrlXhKPzTx3VXg7Xn3d6
	 2jeCjaIQxf4Bg==
Date: Sat, 28 Feb 2026 12:34:40 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-poodle-of-wonderful-justice-acfab2@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228-battered-numerous-35e130c73b93@spud>
 <20260228-versed-wapiti-of-blizzard-4677aa@lemur>
 <20260228-crested-swimwear-a57a3060b860@spud>
 <20260228-unbiased-mature-beaver-680aba@lemur>
 <20260228-pasty-clerical-b87a92aead3c@spud>
 <20260228-ruby-hawk-of-valor-41f0b0@lemur>
 <20260228-aqueduct-nuzzle-c03be63e03af@spud>
 <20260228-arcane-mamba-of-refinement-6dba82@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-arcane-mamba-of-refinement-6dba82@lemur>

On Sat, Feb 28, 2026 at 12:21:27PM -0500, Konstantin Ryabitsev wrote:
> Argh, escape_markup will, unhelpfully, only escape actual markup. So, it will
> escape [bold] into \[bold\] but leave [PATCH] as [PATCH]. WTF, who decided
> this was a good idea?
> 
> I'll commit a more wholesome fix shortly, sorry about that.

OK, the more wholesome fix is in place now. Please try it out and hopefully
that lifts the curse.

Thanks!
-- 
KR
