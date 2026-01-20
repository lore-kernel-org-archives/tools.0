Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351EE43DA2B
	for <tools@linux.kernel.org>; Tue, 20 Jan 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922970; cv=none; b=Tr/VMp7ocsUNLp72OHceLzLYuxSYJMRy9gjupsrfN+icn7j4aSSUa7lI9zPWceuj7qtKpkMS+97eH6CqUtN+NbA1d1OybSbTmfA46cihOSJQr/uLW+g5/OV4Z6KGMS3i4ZCdEa2rOJ2Gn7M4x73UMJeIAoArfcDhAj0TWSak+R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922970; c=relaxed/simple;
	bh=aHY3lxZiHbJCIeTEbe2UnTI7T5TBW3zlFhC2UwIn9gQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ftigd8xe6X1VIg/9z2mjFXEkJvh8osP0mgWuqe2eXLwbiDefF20QWqO7goeIdLFY2uKiZ8ozAIGDREktTCyRmaAF5sWdLc9YintBXP4eldzmEsfGTvWUFYJqlRVFZIRcup3ua6RJz4tOXbeITFG9TuPJhkR5hI0HNJly/Qtvwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Uib/vfdc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Uib/vfdc"
Received: by smtp.kernel.org (Postfix)
	id D6444C19423; Tue, 20 Jan 2026 15:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDA6C16AAE;
	Tue, 20 Jan 2026 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768922969;
	bh=aHY3lxZiHbJCIeTEbe2UnTI7T5TBW3zlFhC2UwIn9gQ=;
	h=Date:From:To:Subject:From;
	b=Uib/vfdcOsjnPdIvYQovfuA7h7nlBNR8awdgaocRZ/uuZgXHQpZyMarST57AzWEow
	 1ijOqJKcAB5h6g3JwpsjOXFrmrLXN9fXFb/MrAWjefnn73S8gbFSTTWe+Zg0yaP1vu
	 /wr2fYDJ7wR7uIGEBx69e29Xcx95ZBFlgkR8Zlkk=
Date: Tue, 20 Jan 2026 10:29:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org
Subject: korgalore v0.4 now available
Message-ID: <20260120-proud-energetic-pigeon-72bcec@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Korgalore v0.4 is now available with IMAP OAuth2 support for Microsoft 365 and
several GUI improvements.

New features
------------

IMAP OAuth2 Authentication for Microsoft 365:

This release adds support for OAuth2 authentication (XOAUTH2) with Microsoft
365 accounts. The app includes a built-in Azure AD application ID for
zero-configuration setup, though it is going to show up as "unverified"
(it's too much work!).

Your corporate IT may block third-party or unverified apps by default, so in
this case you will need to either get them to approve the korgalore app or
give you their own client_id. 

Example configuration:

    [targets.office365]
    type = 'imap'
    auth_type = 'oauth2'
    server = 'outlook.office365.com'
    username = 'user@company.com'

Improvements
------------
- Close network connections after sync runs to avoid keeping idle connections
  open between periodic syncs (IMAP, HTTP sessions)
- JMAP target now uses shared requests session for consistent User-Agent
  header and proper connection cleanup
- Add GUI optional dependencies to pyproject.toml (pip install korgalore[gui])
- Support AyatanaAppIndicator3 as fallback for AppIndicator3 (needed on
  Debian and derivatives)
- GUI now monitors network availability via Gio.NetworkMonitor and skips
  sync attempts when network is unavailable (airplane mode, resume from
  suspend, etc.). Sync is automatically scheduled when network is restored.
- GUI error messages now display actual error text instead of unhelpful
  "see logs" messages, since logs are not collected by default

Full changelog and documentation:

    https://korgalore.docs.kernel.org/

Source repository:

    https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git

Install via pipx:

    pipx install korgalore

-K
