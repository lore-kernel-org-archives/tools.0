Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F130E82F
	for <tools@linux.kernel.org>; Fri, 20 Jun 2025 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750448060; cv=none; b=r7VGzlSBv4Kj0YFGXm/f0NmQANAPXjHFKAUEJ+qFAMneB2pTmZ6sHSnj6Ycqff4jNxEpa0TniVHq+3DPA13nn6oJHDqE12F3PPpYEyfCnaT8PLefu2SIxPUU+HbtBihoTO88kiNJIB/BGTDNSiKlzjGcHroEeYEvFbUp5fJO7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750448060; c=relaxed/simple;
	bh=un89o4D80tj/AWAWSsN0ZdoDPPRB3vSvnSpI5D7G2vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghQPs0Nq3hToFcajdm8VT+mA5tfIzZdrE1pVlzIG+Ou0U7tBXAgd6uWDHOorxrfwuQIBzRcZbLCUdQTy8XQLqKlayB8Ayfu4hod8Auz/sudMGcJMehNvQhS1k5QeT6kOb5fomZ32PyHKFo0eZ0aAK9cFx4htBqQvQfT+961lqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fLUz0P0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fLUz0P0s"
Received: by smtp.kernel.org (Postfix)
	id 451AFC4CEF0; Fri, 20 Jun 2025 19:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2756C4CEE3;
	Fri, 20 Jun 2025 19:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750448060;
	bh=un89o4D80tj/AWAWSsN0ZdoDPPRB3vSvnSpI5D7G2vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLUz0P0sBlCk6DjxfWrcUzykGaYNz6CeG65NjqTNExLx0RW+DXqkRuJqvw2InQFpi
	 KeKmtOEYAz5EmeEmEwzNvM99PpB7rC31PXU3kETwhrBx9zqSdJHmf9gWevSD6gdRvg
	 pJz+zmjupKynGZvh1xE7qcQqsK+mypPYDSH3VkWU=
Date: Fri, 20 Jun 2025 15:34:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tools@kernel.org, Brandon Maier <brandon.maier@gmail.com>
Subject: Re: [PATCH] Avoid quoting email names in trailers
Message-ID: <20250620-military-rook-of-competition-fb4f94@lemur>
References: <20250408204715.2787726-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408204715.2787726-1-robh@kernel.org>

On Tue, Apr 08, 2025 at 03:47:15PM -0500, Rob Herring (Arm) wrote:
> A somewhat common pattern is adding an employer name to the person's name
> in trailers (e.g. John Doe (Acme) <john@kernel.org>). The b4 trailers
> command will re-write the trailers with quotes around the name.
> email.utils.formataddr() does that as it is necessary for email headers,
> but it is not necessary for trailers. As we already have the original
> value, just use it.
> 
> This effectively reverts commit 832010c4d50b ("trailers: normalize
> address after parsing") and all the follow-up commits touching this
> code. Maintaining quoting or lack of seems more important and common
> than oddball 'mailto:' links.

I didn't take this directly, because I didn't want to completely reverse that
commit, but the change in the latest master should do what you want.

Thank you for the report.

-K
