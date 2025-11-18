Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DF273D76
	for <tools@linux.kernel.org>; Tue, 18 Nov 2025 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496801; cv=none; b=RyReD3JxheaCH4Pa/pLPMbTjJ7gQ+SbOyShvLjdfuQlsYIfD1tBj3lfqjfmnuJ9oRhGbRdwmocMIcfZAzx3DxP0bE8xLPLeVP1O7fr0nBuUzqDxrhQ2ttnsWL/cCfFFEwfIshvmNWQ3RiFiUbja8ivRbQeWZKpGa0M04YnGt/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496801; c=relaxed/simple;
	bh=AM8PpUcXphiTAS3Hgrrai4ScT+rXwaPY00RPy7/BT84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecfstf+zkpjiRFSc7kRBAS9B86btMSkMzwvnn3Cv0UTaGQ+ygixtSFo09acaC4Hja25Wp2kLH2Dj2+pmRs8jXngFEPaOAESWZbGJ3vRkMwuC977wiqwIMOz6wa7Fzuhu+VNgxmW60x0LvnNCWs1wAA1Eimt6cZzbY2gU4htPkxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pzhOInVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pzhOInVY"
Received: by smtp.kernel.org (Postfix)
	id 82B70C2BCB1; Tue, 18 Nov 2025 20:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF985C2BC87;
	Tue, 18 Nov 2025 20:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763496800;
	bh=AM8PpUcXphiTAS3Hgrrai4ScT+rXwaPY00RPy7/BT84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzhOInVYGiJobLnbRWsJHZuBJgqrR/O+T0yEcUnPRD+ZOGbrM/6HVQq21jRjAKKG6
	 Gy+iVbiw3tm0VVn7jZDKFyOtc0chy8pdGmMRuHSdJVc0+3a6Ix0PjKqiIh14xzqiZ/
	 MrOQks9U0gl9/nJeOw0SkFHgyknWRuGeGOO30CR8=
Date: Tue, 18 Nov 2025 15:13:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] prep --check: Add support to spellcheck is codespell
 is installed
Message-ID: <20251118-discreet-hoatzin-of-coffee-8503cf@lemur>
References: <20251107-check-codespell-v1-1-cacd9d69b434@suse.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107-check-codespell-v1-1-cacd9d69b434@suse.com>

On Fri, Nov 07, 2025 at 10:51:35AM -0300, Marcos Paulo de Souza wrote:
> This commit add --codespell to checkpatch.pl is the codespell package is
              adds                             if
> install.
  installed

I don't mind it, but can you please send an updated version that fixes typos
in the commit subject and message?

-K
