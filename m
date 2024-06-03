Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105D59B4A
	for <tools@linux.kernel.org>; Mon,  3 Jun 2024 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421098; cv=none; b=qBelgIusd6+AGwouUcF8DQU3U94qdIpV965BQKaJTUDFVPAx7Y27ko104xpncWP/0VsOv/yHyt8UgSlAqZOHSHo5kdMoZnvIHRGdspEcSstMYNtKNuZWH8Db3/VleHoeFPSAqqev88KICYuk8YgnyofCTWZxRJoWf0d0v9aJsBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421098; c=relaxed/simple;
	bh=bk3/BXNCSPzTKH5oNboH4w/TdOl8X3fBDlc8RrSIbRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEi3xd/qHkUsRsSupsy5Z4YMaztxTm55e3s7VAlbpq0E4mfZwYD53zLeH0f7QcEZVSxWjEHOK7oK3vB3ajAjS4vCxK81nVRTGU05DKD8X20fA+S6+PBoEA6Bxhd63Y1702e1zWV+dK+2CeLbkqdcS/c22N5v1xtlYV1qvIT1I4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=adrq6teo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="adrq6teo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496AAC2BD10;
	Mon,  3 Jun 2024 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717421097;
	bh=bk3/BXNCSPzTKH5oNboH4w/TdOl8X3fBDlc8RrSIbRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adrq6teonIwzI5hHbxOtXPZ+j/bP9fObaUup3kxTU5UefsKFEDgf/kRAgFQnTPa+L
	 5NxNiITXAwMYCqwwnT5oKkAcFwsgGVrlNB+tiyC8tRZdwajYGv56+lMDpkpH4BqpdZ
	 rpUnUgnT+VJ+FPRzsWsq74zP7rl1YcnsqEOGabt0=
Date: Mon, 3 Jun 2024 09:24:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Thread breaking behaviour for non-patch messages
Message-ID: <20240603-pygmy-mongoose-of-ampleness-07a4d1@meerkat>
References: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dcbebe7e-5e01-4559-8bf9-37a0749177d2@sirena.org.uk>

On Mon, Jun 03, 2024 at 02:00:31PM GMT, Mark Brown wrote:
> Since updating to current git b4 with the new thread breaking support
> for fetching patches sent in reply to serieses b4 mbox has started
> misbehaving - if I try to fetch a thread by specifiying a message ID
> somewhere in the middle it breaks the thread:
> 
>   $ b4 mbox CA+EHjTz_u2M-wsNnD_f=_R+dJoYwL9gUrBz=YwdqGZbtTT-aaA@mail.gmail.com
>   Breaking thread to remove parents of CA+EHjTz_u2M-wsNnD_f=_R+dJoYwL9gUrBz=YwdqGZbtTT-aaA@mail.gmail.com
>   1 messages in the thread
>   Saved ./CA+EHjTz_u2M-wsNnD_f__R+dJoYwL9gUrBz_YwdqGZbtTT-aaA@mail.gmail.com.mbx
> 
> which is surprising and not so desirable in the non am case.

bugbot assign to me
