Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C138B7D2
	for <tools@linux.kernel.org>; Mon,  9 Feb 2026 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661803; cv=none; b=FM2g9gqcMgBXJvKPsdkX7duDeOYu/RIrDMN9fe7bQCi376njpmlrJcJgCZUCav58hWzoUBWd5H8kJUsUnv7iPjTE+sh3+D+IcHy6vu7oEMZyXaGhk71WdLPf+6DTly4MLD+Iy7gJgcgAJFbYqKkamYn8nCJQ8yrmypTchtrlOE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661803; c=relaxed/simple;
	bh=jaTmFYtNRQSQ6Yfu8d3I1VU/DQaK/rRx97KyxdIJtac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PATlUHa+djJdjB209bBfbwG7CFY5XAakZH5uL6YLqCx4M/jn8WZv61cNyb+K4IvsmcjmJyxKiVPz/iYLHNUC6kl/FBRcP72Pk4v4JF2l00S4P34cMhoKcoTQkpDLLY+UXPwCMu8hGLyAMO/btgPyEEeRTqxXG0ly48HJesj9Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfTETcXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfTETcXJ"
Received: by smtp.kernel.org (Postfix)
	id 1D3FBC19423; Mon,  9 Feb 2026 18:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75AAC116C6;
	Mon,  9 Feb 2026 18:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770661803;
	bh=jaTmFYtNRQSQ6Yfu8d3I1VU/DQaK/rRx97KyxdIJtac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfTETcXJ2V05SFWcRTbHqVdI5OsVYGC6ltceUSiS3v80MlmYIQqwCqnR2gSBuqBqD
	 ti4lXXC3synGVgo5ddhI//cs1ih60w52R63rc+QzUM2f8e0uUkhoZocbyXYLHTYvEK
	 z4jhdJHqVSIFbv1H4KvEJTzSwV9YUeCSov9H3LQIKdG434DoB2+n8LgmkJn30VQk+I
	 o/GjzfmXjRaTyLfnlpMReyp161yKGOYaDtMzzKZEH1nCXmMPACTKgcMJgTPaDS3Fyv
	 8gO56+RSBfmInGL/1egEog8yx4c8G4OVMiwEs9IwGbfY7FXLfGi8Tx6Hwbrh6yPzx4
	 +oVub8P+VvZZw==
Date: Mon, 9 Feb 2026 13:30:01 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: tools@kernel.org
Subject: Re: mlmmj version?
Message-ID: <20260209-ethereal-beneficial-owl-1ec496@lemur>
References: <20260207053820-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207053820-mutt-send-email-mst@kernel.org>

On Sat, Feb 07, 2026 at 05:40:09AM -0500, Michael S. Tsirkin wrote:
> hello!
> a recent mlmmj release (1.7.0) has a feature attractive for virtio MLs
> (self moderation).
> 
> Curious whether lore uses some distro version, or self built, or what.

We'll build it for sure, but it's pending migration to RHEL10, so I don't want
to change it on the current system until the migration has been completed. At
that point we'll probably be running the latest released version.

-- 
KR
