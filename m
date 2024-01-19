Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2B7EF
	for <tools@linux.kernel.org>; Fri, 19 Jan 2024 21:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705699241; cv=none; b=cmFPIlnNLkm0+n42qSrBhKEcZlG2OeChDxDrvAFyL7c2yIZKBXy+VbyM9ceV48cIGlQriTU6TTCUt9jacd+75mCOPxARPeLF7GdAaZW+uH5bovMZAfnfFRtjh4fvHQ9MEzE6xWo8ttCZMQbGtdvzGQYJ0UZr8Px4YM1uYzLmqaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705699241; c=relaxed/simple;
	bh=4ZG5taYBdsTW0CYDOLYN5pJbq/gdoB2J5Ayb5ahYpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ja3VwH+z3iGootgthqPYUwkjQxgCYhVCBZzOFFpc2awA2p65HaoR7amkFqS851OF2S7pRBpm6603t9YhsHJQjV5P42R1EoV7WiTwGwtYksrXIMGXohaTWoLHZ/xp9Gkf4vrBWnj/6n8CwQ2pLdVmt4qJZNb2YsClIbTnnLE1prA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KCPVttmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KCPVttmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEDFC433C7;
	Fri, 19 Jan 2024 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705699241;
	bh=4ZG5taYBdsTW0CYDOLYN5pJbq/gdoB2J5Ayb5ahYpp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCPVttmJ1UCu2NFvQC3x9Y0dRq0vd7YEBJg8gZnNW+CO1GmNLvdPlTGydYlJEt1V2
	 lAsHrAmBHRE9FTP6g4edeC6M79j/rtpstgjwFp8BolSsE39aSYfJei0Jc6szJ69/2D
	 DOB/msd0IYpz1ugHS2iG7OyOUUZ4jHl5MCcMg5Ew=
Date: Fri, 19 Jan 2024 16:20:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Restricting trailers to update for b4 trailers --update
Message-ID: <20240119-determined-diamond-pony-6a80cd@lemur>
References: <39a94633-fde4-4060-9c9e-de7d5a92a6bb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39a94633-fde4-4060-9c9e-de7d5a92a6bb@sirena.org.uk>

On Fri, Dec 15, 2023 at 08:56:46PM +0000, Mark Brown wrote:
> If I attempt to update the trailers for a branch using
> 
> 	b4 trailers --update --trailers-from ${msgid} --since ${base}
> 
> I would expect that only patches on the current branch after ${base}
> would get rewritten, ${base} would not be touched.  However what I
> appear to be seeing is that at least ${base} gets updated (the base is a
> commit I did, I'm trying to use this to refresh trailers for commits I'm
> applying).
> 
> I'm specifically trying 20231215130300.1247475-1-Syed.SabaKareem@amd.com
> on c27032b402a10d9f258224685322f121de0808e5.

Adding this to bugzilla so I don't forget.

bugbot assign to me

-K
