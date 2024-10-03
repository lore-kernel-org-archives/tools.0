Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4514719E98A
	for <tools@linux.kernel.org>; Thu,  3 Oct 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968386; cv=none; b=C1ejTTUXy9WYYewwbwQSkuAXWdTWGcQ+s9KFYIAXBo2S5PK3DhfsRQfIRiuI7303aMsH3HOLHO5jug+Gp3dF5tnnCAf6pNlZuPXw3o+0+yeM/8MFW3AYAf8NrD9LlDOhmS+JDh+6s1LCb61/EzBMudKj+aZicXpa/zwRaH4Ni2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968386; c=relaxed/simple;
	bh=UOSz8yXK8xYRFwRXB+XV5J4rtjA0VCEmqitY+Ojjb68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhqu9a19EyqNQRJvW42Aa3bnzUsZP0F937rLfXWwV2iHvXgR75iljLAcOdyNnT1nd1f8LetM6NqTL9NFOCv0u4A0y+ihUb1fE9J6AV416piEh7MaS/dLsx+FyBJfVvqlR+gbk0nRFu1UUNP5A+aHtrhv1MfSuy/B2l1cAsVxf7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZfaJEdzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZfaJEdzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A10C4CEC5;
	Thu,  3 Oct 2024 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727968385;
	bh=UOSz8yXK8xYRFwRXB+XV5J4rtjA0VCEmqitY+Ojjb68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfaJEdzdrrY0pH9F5Sd90InICa4Y3yvaTVFMubdD/MJHQdwqcsqcPWQ3vwvJQdH23
	 E36DmxDDKZC+DDgh+lmdugUNQXuEoMfRkrVUCAVWxZFe1YexY99H9AaKopAXeNyhz2
	 xwoEHJxfm4OH7yBwwpDZ1WFoFpKiEqI15D/7GjkQ=
Date: Thu, 3 Oct 2024 11:13:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update picks up bogus trailers
Message-ID: <20241003-exuberant-eccentric-mouse-7f5aaa@lemur>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>

On Wed, Oct 02, 2024 at 12:51:50PM GMT, Mark Brown wrote:
> With current git b4 if I run b4 trailers --update on
> 
>    https://lore.kernel.org/linux-arm-kernel/20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org/T/#t
> 
> patch 2 picks up reviewed-by trailers which were sent in reply to the
> prior versions of the series even though that patch is new in this
> version so the update is clearly bogus.

Okay, this was a bit hairier than I was expecting, but we now do a proper
patch-id match for all trailers we have received and only apply them to the
patches that have not changed between what the reviewer tagged and what is in
the current tree.

Please try it out in the latest master.

-K
