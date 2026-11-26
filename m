Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714811;
	b=QqfrM1kjPAYVOE0wazYSAt+p9A0Gyo3h2APzzrn3j7+uMy6obBRV4Gq7BKd2+hWeKS1h
	 E7MrvwCxIblaX8gapduX5jFlAta5P9mx+we6xhpy325rtgxxOGm+3YgZDg7HCnAsGRucK
	 u9LMhiXJ+dRj3lJcShRPDSmzpdaFQGMOAOKstek8N2TmwHSdpQk76sF2eHSKJB9Cqs8/E
	 99vGM9DfaIAuPAepivpTwYUwBdWT7KltNWJ4tV/F7mSjJWaXK/YTb5xoYAdv6SzAK2Xw7
	 ADWKw71YMnMFb5NUqKmoQqi6pV59Vjb8duHBJEE5jIXBkNYf9Tzg8qJ+S39pdthj0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714811;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=J+4pqzoI1UdpCS1UIflYAu+tRlogSSCvc83y+faap5E=;
	b=nkAjOLn5YXt9LFdLN6voM6BO6vxAka8crWiJV6vikZVO6xLcV2n+hnsrqe0ZP1T2c1lM
	 6H5TLrpAtt2LvVlukj0SnlIrMaC6L/mk0HpSh1OJjCJ1sG8olmAFSDATLTInQdy85K2yE
	 3PPeMes5sFUKTj54vi+L9TPH/ee3zIyhidG8T+Gc3L7UYwarEd1EljFBtUFTg4/cWbinu
	 8w5CFxU+yQ0F0GHB1xL6sn/cgLG5ihsP4MjwsxTNkNuA3l4NxxSyQst8QYQYWA3KgOeg6
	 ZYNRNpODAcLt/TyIL2la1Fm2ZnO1YxpbqvpOowBYtChn555U1l+Lz3EYCBltXH6MQrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ah/Foefl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DC606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ah/Foefl
Received: by smtp.kernel.org (Postfix)
	id 8D9921F000C0; Thu, 26 Nov 2026 17:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F611F000C6;
	Thu, 26 Nov 2026 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795714810;
	bh=J+4pqzoI1UdpCS1UIflYAu+tRlogSSCvc83y+faap5E=;
	h=Date:From:To:Subject;
	b=Ah/FoeflgktK9mpwyGDwgTgXq9U2I00ZMos/ls9Zw5znbAZdspcmhpIJpQWbcWwqM
	 6nyb461DTllB9WMzyOJIxQ/2fuZ11o9Nfo1GmMRN5BE1STbi9WXYo6cjBWfht/OhVj
	 ak5Nr/0xk7PF5aQ9D1X7ogkadeHL2qexuf8NBrTNMR5FBKS2l3Oj4SBZXcXBEVzCXy
	 Teo/r731X9ITRUlFxiV576/jQX864kmf4Tdyx8fI/IpYEctzIp7pX9DhUAEbYORQOU
	 +bYz5bgqMLbtF+IJK4MKs8ICl8j/U9ARAXJHiBwEEUfOjh2Nm4EXutLsegE61bZArr
	 25Blhxwj6qJ6g==
Date: Thu, 26 Nov 2026 17:40:08 +0000
From: Konstantin Ryabitsev <mricon@kernel.org>
To: tools@kernel.org
Subject: korgalore v0.7.1 now available
Message-ID: <20261126-bald-skinny-poodle-acfd0f@toolbx>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.7.1 is now available as a bug-fix release. 

- Gmail and IMAP (Microsoft 365) OAuth token files are now always private: The
  Gmail token file was created with the permissions from your umask, which is
  usually 0644, so other users on the same machine could potentially read the
  refresh token. Token files are now created with mode 0600 and written
  atomically, so a crash can no longer leave a truncated token that only a
  browser login can replace. An existing token file gets fixed the next time
  korgalore refreshes the token, but if you want to force it:

      chmod 600 ~/.config/korgalore/gmail-*-token.json

- A crash or power loss no longer breaks later pulls:
  A damaged state file used to stop the whole pull, including all the
  healthy feeds. Korgalore now rebuilds or refetches what it can, and warns
  when a delivery has to start again from the top of the feed.

- A failed lore fetch is retried on the next pull:
  Before, new mail could wait until the list got another message, which can
  take days on a quiet list.

- Maildir targets store messages with LF line endings:
  Mail readers such as mutt, notmuch and Dovecot expect LF in maildir files.
  Messages that were already delivered are not changed.

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Upgrade via your usual tooling, e.g. with pipx:

    pipx upgrade korgalore

Thanks to the following people for patches addressed in this release:

- Javier Tia

-K
