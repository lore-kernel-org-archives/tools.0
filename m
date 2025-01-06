Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE091E04A7
	for <tools@linux.kernel.org>; Mon,  6 Jan 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200778; cv=none; b=AmIUxr9vu83ab0oNae+GynJBgYdyesl9Zejb8YCiLzH9oJCmYL8SweJUErAz1icB8bK//djx1z0riA6LW83bVyjIH6dGMcUJlgpDwJ/xvVpt9RruHWz3rpF+JTikKshMJg7GIdln8eawWnq9KHO7xUKGI33Xx5ijo/SwI3b2z2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200778; c=relaxed/simple;
	bh=DZ3rzW8qc3hb1W4x1aMMFIJFs+NWjC3it9DJr2BYr34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hov3gItqNbmSed76i3fFGyz6xH8yME1mvEbdiZT1E/R4qk6HCyYM9lRhgYzsX/mAINzmRPhJWnJxWqpy6XFvLaU1AKP7A/G9pEziQwDP5I+V17Cl2qK0golXYe2EhUwkZV4IjewpyKRvnJqc58bj82C1nLOiN9zrimnYFf9iORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EfYIrInS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EfYIrInS"
Received: by smtp.kernel.org (Postfix)
	id 5A176C4CEE5; Mon,  6 Jan 2025 21:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E648C4CEE3;
	Mon,  6 Jan 2025 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736200777;
	bh=DZ3rzW8qc3hb1W4x1aMMFIJFs+NWjC3it9DJr2BYr34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfYIrInSpTenS37zPRIh7hEWy+3cn8RcOuztt2fQXyV2lXX4urFHucr2X+vO+z188
	 KsfYaG06mwuhqXFyc2V2lZrWRtTkZmt+v0h5DIkbHbdoz6rDS0I3x1t9J1jDnhgAiD
	 xnTuCU3eX1SftaeaWToe2T5q83RvuAwfc10HCZyw=
Date: Mon, 6 Jan 2025 16:59:36 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: tools@kernel.org
Subject: Re: "b4 send" only handles one instance of sendemail.smtpserveroption
Message-ID: <20250106-fresh-ninja-hornet-94e6d7@lemur>
References: <Z3vkoDal1ShoPpqG@probook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3vkoDal1ShoPpqG@probook>

On Mon, Jan 06, 2025 at 03:11:44PM +0100, J. Neuschäfer wrote:
> Hi,
> 
> (using b4 version 0.14.2)
> 
> first of all, thanks for implementing sendemail.smtpserveroption in b4 :)
> 
> Upon trying to use this option with b4, I noticed that the resulting
> command line only contains the last instance of
> sendemail.smtpserveroption specified in the git config.
> 
> I think it should be possible to specify multiple options:

Yes, thank you for the report.

bugspray tag me

-K
