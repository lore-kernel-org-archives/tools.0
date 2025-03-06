Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A519E99E
	for <tools@linux.kernel.org>; Thu,  6 Mar 2025 19:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288726; cv=none; b=lUOlgd2x+OovVDMPXWBwa5WK4E5snprt5bXHh1YZsBMPstvDmSDEqHdPQs2vHnxC5U3BeS3JyDZrLXC+W/FsdVnhDUE5bZICJd74yRgoK+MZkwBRd2lVr70OrprzJtDThSepOAML74hJJ/r9ba4dGV1Q0QWc5bvgRbVo5sw18pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288726; c=relaxed/simple;
	bh=Ludeg3Y1FY4JVVaKUvYoriunFauj385+WVj0yFPbJEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSXAYLlLIbLbL85NcjnNjfLbr62ZkeXbi5pfHMR5JAcyUSTgNyenKWYaI7oJNr7Dzle9W+wLR3/m6KJK0zMPpYxEf/2umLd4Za65CUrSa2mZyExcyOd0pkHY2aitwVPKn+bQeh9/SjAAtCMjpyPhqrqb2rytGNHxdnkCwAfvOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NLMB4aRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NLMB4aRg"
Received: by smtp.kernel.org (Postfix)
	id 7C65EC4CEE4; Thu,  6 Mar 2025 19:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F9CC4CEE0;
	Thu,  6 Mar 2025 19:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741288725;
	bh=Ludeg3Y1FY4JVVaKUvYoriunFauj385+WVj0yFPbJEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLMB4aRgLVxhci02q6Exdu7qkkRLji0b/fOxJCrI0ag8WijaLE0HPHGiz/QEcZ66e
	 c/puV/tdwd/C27aF5eD2nUqLyHkAajIsZIqjYQtFQfoHyATKyRt7VfJfdT8Y5TkWQL
	 OP8FCsKB3y6+F2Uf6hYxH9SrbKlT1yGVUWjMEkPk=
Date: Thu, 6 Mar 2025 14:18:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, tools@kernel.org, 
	Chuck Lever <chuck.lever@oracle.com>, Joel Granados <joel.granados@kernel.org>, 
	kdevops@lists.linux.dev, Daniel Gomez <da.gomez@samsung.com>, s.prabhu@samsung.com
Subject: Re: [PATCH v2 0/2] guestfs: bringup: fix networking issue for debian
 hosts
Message-ID: <20250306-cockle-of-unnatural-fertility-0d022d@meerkat>
References: <20250306-fix-bringup-network-v2-0-85298d7a0ba5@samsung.com>
 <Z8nV7bBKx988TE0E@bombadil.infradead.org>
 <wvivcnffxy26z7epqezuwvpwu2j35y7a2ykpybialbcjk7usug@as26osrx4amn>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wvivcnffxy26z7epqezuwvpwu2j35y7a2ykpybialbcjk7usug@as26osrx4amn>

On Thu, Mar 06, 2025 at 08:11:30PM +0100, Daniel Gomez wrote:
> > > Note that when libguestfs was introduced in kdevops [1], no install-deps
> > > like playbook/role, etc was added and my best guess is that new kdevops
> > > installations/users are currently installing libguestfs manually
> > > (vagrant playbook currently installs libguestfs-tools [2] for
> > > RedHat/Fedora). So while fixing this for Debian, also add libguestfs
> > > package support for Suse and RedHat/Fedora distros.
> > > 
> > > [1] 03b6eb1d34c16aa654f44e5668f0af9e075367d4 ("guestfs: add a new local
> > > guest management variant")
> > > 
> > > [2] 99b78db71edbb01048f375030ff464e7f8faa024 ("install_vagrant: enhance
> > > the redhat install")
> > > 
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > 
> > SOBs are not required on patch cover letters. Other than that:
> 
> SOBs are automatically added in cover letters by b4.

Because several subsystems use cover letters for merge commits.

> Adding b4 mailing list to the thread.
> 
> Konstantin, following Luis and Greg suggestion in this other thread [2] on not
> including Signed-off-by in cover letters, can we remove it from b4 cover letters
> or default to not include it, and perhaps add an option for cases when it's
> needed (if any)?

An S-O-B in the cover letter is either useful, or it's completely harmless.
Increasing the complexity of software to solve something that isn't a problem
is not the right approach.

-K
