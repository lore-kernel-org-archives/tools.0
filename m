Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE333509C
	for <tools@linux.kernel.org>; Thu,  4 Dec 2025 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859298; cv=none; b=VavI9pkyc3UyOpNHJMufyNKH/4yEDUst8ZCi7mY91INhCkkrBX+xSv85l42hNAXvn0EuPfad5IEC1pSvPPNY7TXg9zT42mucuY1shRGZ2ofIyWD7vqdXiEgCT9v+IMCemym3VEzIU4S3GIPG84odMT02Ezbw6bWekfCbreAU/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859298; c=relaxed/simple;
	bh=Hh7sxrPTG9dB9aTOTofaYiaubN7BPLVDozPzXq0E5Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnfIPmxC7hjRVLDfS9ujY7cm1V3L4xDToFHw0FIB85OPoxyGrZKT1uMUOE+YM+biwctHHbad075TGwuhF+P3hpoeqfy8vSN/Np/EoLJVKYsHCPtBPJM37e1E3cjoCJ8S7VMVYAYbq2EmLugUHyQ1B5/10cQUXOy79xOwfiX2/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oavZa5Lo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oavZa5Lo"
Received: by smtp.kernel.org (Postfix)
	id 55D56C116D0; Thu,  4 Dec 2025 14:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227FAC16AAE;
	Thu,  4 Dec 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764859298;
	bh=Hh7sxrPTG9dB9aTOTofaYiaubN7BPLVDozPzXq0E5Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oavZa5LofBCv/LZr6LKtsKN8VoT32fYX/AIWR5/aQAIP6xEaeADncrVPDdZZFVIjM
	 HoCzT5M6xYm7/VoAgT+0mPFM3vGPtx/aas4rJhrHdyN74I91I3/75zprVnTRWUffiC
	 TeF2zk9EnRAPfLwfnlUMN05RJVAxJNZJKgppv4MQ=
Date: Thu, 4 Dec 2025 09:41:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4] b4 diff on multi-patch series does nothing (and fails)
Message-ID: <20251204-quoll-of-sublime-skill-8a039c@lemur>
References: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f1646bd-3802-4bd3-8ecd-2ea6ffb16e4d@cherry.de>

On Thu, Dec 04, 2025 at 01:30:42PM +0100, Quentin Schulz wrote:
> Hi all,
> 
> I'm flabbergasted, the same command I believe I ran a week ago doesn't work
> anymore. (the same series can be applied with b4 shazam still today).

Yes, I can confirm that this broke with the migration to the new servers.
Somehow the search for previous revisions now only uses the first patch in the
series instead of the entire series.

I'm investigating and will follow up shortly.

-K
