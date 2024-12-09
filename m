Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70919F117
	for <tools@linux.kernel.org>; Mon,  9 Dec 2024 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733783607; cv=none; b=iqOudF8u2Hwv5Z9+uzQzTvatFoucHdXkjpXWmh6ePPyrt4ratUQQ2GDEBvkY+BGpJwqbIOyt71Bn1yalomq1yw1mX4wMyBOiosFUpyutxFmYaeLHTUS+gAmpbDrU30ckccQBcZUXnpmPXLvk8mZr9a+T41gtMU3iRNbHO243ow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733783607; c=relaxed/simple;
	bh=aFONJu0WiNOn62A1zHM/kRiWeBA3L37RTv4s6+/8m44=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R2cC4qT1VU29ngPODCWDYAFfPLl+snTaKKTSd7oc0Y2ti3T/KBKy6/w+Oq3cNqZUjPpAUMOCD0krGkBviMM5lZY2AfSscHQynZLfvjmptzakel6LYya6lHBYx5Cs+zC3XNdepLhsa4BYYPZcXFo/aBhpVi+k/IvV7LxBcXoLSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8bmsrLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8bmsrLI"
Received: by smtp.kernel.org (Postfix)
	id 78520C4CEE5; Mon,  9 Dec 2024 22:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B1CC4CEE2;
	Mon,  9 Dec 2024 22:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733783606;
	bh=aFONJu0WiNOn62A1zHM/kRiWeBA3L37RTv4s6+/8m44=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=S8bmsrLI85wHwjUCsK+FXp5tYWOlSJOEDltVJGTXTe0WlFjdmkD1BHp/ItwnH+fFJ
	 RJ6E526HBKtb5LWjreqtncXi+scdx9r7+6TSQm1kZNAv+0Rl2hbLQGJcBnOqHqvKfl
	 Vcbpnl3E8g68tVh80+5hdCW80VkeNN44HyrfCqHC3ET9rSrCMP5Nqkf/73po2gmVlw
	 j8EbmuLPtaR93MhM5VpmfFBNkWDZbZW/esvTS5Y9PHO9Yk7ZuPEwnxscWxSDLUTrj7
	 jbxUzh+Znl+hfY83dYVKwLchXCdmPXe/0BTlf4854Ub14TzcdzyzxF4OGx7k0HTAou
	 XRQoLLv1l5SPQ==
Message-ID: <fb1f8107b39dc574a35b3c0a381c6d0d1f8f9fae.camel@kernel.org>
Subject: Re: small b4 feature request
From: Vishal Verma <vishal@kernel.org>
To: Jeff Layton <jlayton@kernel.org>, tools@kernel.org
Date: Mon, 09 Dec 2024 15:33:24 -0700
In-Reply-To: <9244489135d7366f15ea687ff068ab1b20913fc5.camel@kernel.org>
References: 
	<p8ViV3yfc4oH3IgmIkXuiuhx92Va2KrVMYttHaXXGDsnnqtVmaqllPhcfSp-nYuqIL5udMcc8W-7_Vm8JlSPyQ==@protonmail.internalid>
	 <9244489135d7366f15ea687ff068ab1b20913fc5.camel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-09 at 17:13 -0500, Jeff Layton wrote:
> First, let me say that I love b4. It's great for managing a patch
> series over time.
>=20
> I often carry around the b4 commit at the base of my patch pile and end
> up having to rebase on top of it. It would be great to have a way to
> specify the b4 tracking commit symbolically to git so I could do this
> without having to lookup the commit ID of the b4 head:
>=20
> =C2=A0=C2=A0=C2=A0 $ git rebase -i B4_HEAD
>=20
> git recognizes HEAD, FETCH_HEAD, ORIG_HEAD, that are specified as files
> in the .git/ directory. Is there a way we could keep a B4_HEAD
> reference in there that always points to the b4 tracking commit (if
> there is one)?
>=20

I second this idea. I've been scripting around this problem (of
rebasing my b4-prep managed series) using a script - so I just call
'git reb4'.


$ cat ~/bin/git-reb4
#!/bin/bash

# git-reb4 - rebase -i --autosquash to the base commit of a patch series
# Determine the base commit using preferred methods for b4, stg, and fall
# back to the git @{upstream} as a last resort.

# try b4 first
if command -v b4 > /dev/null; then
	base=3D"$(b4 prep --show-info 2>/dev/null | grep "^start-commit" | cut -d'=
 ' -f2)"
	if [[ ! $base ]]; then
		# try the stg way
		if command -v stg > /dev/null; then
			base=3D"$(stg id $(stg ser --noprefix | head -n 1)^)"
			if [[ ! $base ]]; then
				# try the git upstream
				base=3D"$(git rev-parse "@{u}")"
			fi
		fi
	fi
fi

if [[ ! $base ]]; then
	echo "couldn't determine base commit"
	exit 1
fi

git rebase -i --autosquash "$base" "$@"

