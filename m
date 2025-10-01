Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EB1ADC97
	for <tools@linux.kernel.org>; Wed,  1 Oct 2025 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328174; cv=none; b=h3eUc+d4pFF6YswfYd1viShlsyvahX5jgF+AzGEvNCMyBAFcRACLgb3dp2b6ckuuM8wjurRBME9oGPvjY536dZ/kaKHfIRPrgR5qwPQaphQnNFapaEVYhFtFHPJISLTaVrqyB4qFLtf6RfJcoi3oZRm/fOtgByZwcGMtIT/bnF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328174; c=relaxed/simple;
	bh=UiSoqg04QNgprPLJ0ZDBnrdFYdhYWIqACd0FQ9N0//0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozY/TLpmSVyOpt10U5sL14LL3jqsq/4Fd4RtcereuIOmEYGRpqaxKv2YRFhhVpIsvxd0GkyrQBVOnVCx7wOZarglZ8CPlmulRN6DyGEtWsJrmGFTdNFf/iwFyDL+3G47shI1CXWKgatjZnJYdkxm9O8fTOVLX8YsTHw68ULBH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R51Jxc/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R51Jxc/1"
Received: by smtp.kernel.org (Postfix)
	id E7EB0C4CEF9; Wed,  1 Oct 2025 14:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84C3C4CEF1;
	Wed,  1 Oct 2025 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759328173;
	bh=UiSoqg04QNgprPLJ0ZDBnrdFYdhYWIqACd0FQ9N0//0=;
	h=Date:From:To:Subject:From;
	b=R51Jxc/1yts8pZDhYqySkKy/8EwCdH6IuKFYnPyQNzhM8OTb2lqyRyPonYMs4YOAF
	 j28CY0kTWguLkg3MXvE3wdy8DEfJ/WzYF6uc4BJOhgKaM/IBrX52iEphUQVuRfARV7
	 kxlQyg4Oess0EP61K2VtYFlMkE2/2G+7JwzxTld4=
Date: Wed, 1 Oct 2025 10:16:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 v0.14.3 available
Message-ID: <20251001-rough-cyber-bat-81cece@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncbjckajtfavcbkn"
Content-Disposition: inline


--ncbjckajtfavcbkn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: b4 v0.14.3 available
MIME-Version: 1.0

Hello, all:

We're way overdue for a bugfix point-release, so here is b4-0.14.3 with the
following fixes:

- Don't strip trailing blank lines in patches when not needed
- fix show-info in another branch
- stop generating full object IDs for non-binary diffs
- better handle invalid timezone values
- Create patches with --default-prefix (when git version supports it)
- Add --find-renames to git-show to counteract local configs
- Fix misleading error message on cherry-picked patches
- be more careful when applying trailers to non-prep branches
- Don't quote trailers containing brackets
- Support smtpauth=none in sendemail configs
- when querying by change-id, don't add author and subject
- clean up after git-filter-repo runs in recent git-filter-repo versions

Upgrading with pip:

    pip install --upgrade b4

Special thanks to the following people who helped with this release (in
reverse git log order):

- Nathan Chancellor
- Juri Lelli
- Rob Herring
- Andy Shevchenko
- Christian Heusel
- Matt Johnston
- Andrey Albershteyn
- Junio C Hamano
- Patrick Steinhardt
- Ricardo Ribalda

Best regards,
-K

--ncbjckajtfavcbkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCaN03qQAKCRC2xBzjVmSZ
bDQCAQC6Otf7R2mCMGbJT5p8/2arhxT8AWT5SOqCPRwU+XIp7AEAuhjFQg+EQkOw
Ma7/8r6jghMrlNWJ4lBLaCRtP21MHQo=
=arcM
-----END PGP SIGNATURE-----

--ncbjckajtfavcbkn--
