Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A226C3BE
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311051; cv=none; b=OaAm/uQrKt/ygCP8dtnij0Wapn6sjrjd3bHnUiCNVqYSzqVVhNp2+ZDzqWFelm5kjGN/BReoc93NsCZVccbBa0eAOvAoCSy/913uc6bXajhqP10o6ORk1axzvS9P6ww59S+L5VLsSJnV+BAShrhJeMiuhVE2TDyhCIwBZsI97ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311051; c=relaxed/simple;
	bh=g220HZuxfOrwrB8tAgauKyRAzn12uM8mQoihF2IasbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD6BungUczJxHNHHFCR7sAM/3f5yQenlqtxa05hpbX9kttsb1RkGf+cLOsfIm5IN6WFe+/e/NQFcVxVKCj3+F093XK2QG1L8RNdx8sFbnU9us2HTL3sswcpLhFHS8ngQcdLJT8u6B4Y4yXqpoYQSWRSkCK4ghSNhEuRlcmsLa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uo4upZSL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uo4upZSL"
Received: by smtp.kernel.org (Postfix)
	id A8037C19424; Sat, 28 Feb 2026 20:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3C8C116D0;
	Sat, 28 Feb 2026 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772311051;
	bh=g220HZuxfOrwrB8tAgauKyRAzn12uM8mQoihF2IasbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uo4upZSLIy/l7vaiY3y8aw2oLzrwdiTcRA0Xo1RQgIrkAuBn18cZpVC6HjkAuEy7K
	 0P7KMqn45Cc9h1/pe/sB7pijzeSQz4qJYCEfv0nwbXcqMmicArivYgkO9xYdPFz4tM
	 OpyyCt0bvbVFSSjw2qUpNVvUgj1Wf0XCUpptkocYgV47wISQq6TOMVL2BToiUYemoL
	 gn5g3KaAOwNsvUxUW7DP8SizBeoYyv4Z/Ml5xG0W5T4ZgTlV8QZFvIQXQsw9fuI05u
	 wYzMPfl7rHJUUz1wJKRXpQ/CsRqoLF18uqesi8sbi28hyKjkYy+zRYVvt/iRJDnCLK
	 GqnEDuAPIhGnw==
Date: Sat, 28 Feb 2026 15:37:30 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228-military-deer-of-purring-c9ef1b@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
 <20260228-sparkling-beryl-kagu-8c34c8@lemur>
 <20260228151029-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228151029-mutt-send-email-mst@kernel.org>

On Sat, Feb 28, 2026 at 03:23:32PM -0500, Michael S. Tsirkin wrote:
> Gemini does not take -- before prompt. the prompt we supply can not
> be mistaken for a flag, so it is not needed by any agents.

Bah, that "--" was needed for Claude. /o\

I'll play around with it some more and try to find a solution that satisfies
most agents.

-- 
KR
