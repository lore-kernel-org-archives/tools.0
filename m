Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41547263F4E
	for <tools@linux.kernel.org>; Tue, 10 Jun 2025 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584788; cv=none; b=cBCitgBhHxOQn1zA/UZoKj/PjtY23AC4UubtPW056/BDJas76L+Ogi6pxfeM1KZCgdWxhhEbHz6dJmFPuXWLknc75OZw/eB40vgBs2tGzgq36iKB2trRF2PCoLSWf6OQJ91AaY9eAceUzWuYsV2nYQHoWhSqcz2z1jX0x+o+lEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584788; c=relaxed/simple;
	bh=QkKeOajLITS/kHnLG5GkH3w5wnnJTOHCxyKjO5aJcCY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNvOoPE/i+ziOGhOcbNY2Rw36sbE56TYAtmaMLQNUDwRUDS1TnZy+nucbgxM4hKxDZZwrwwl+3uAnaACH8M93pJAubkzUjINzAsVUXIx8jGWGiTcx6hQbM1lFfHIcjc/g2ojHOrxWjJDwEyheQ/H4AmIE2oqaF71oi+5rpgZhc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePRTAq0u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePRTAq0u"
Received: by smtp.kernel.org (Postfix)
	id E3ADBC4CEF2; Tue, 10 Jun 2025 19:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581ACC4CEED
	for <tools@kernel.org>; Tue, 10 Jun 2025 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749584787;
	bh=QkKeOajLITS/kHnLG5GkH3w5wnnJTOHCxyKjO5aJcCY=;
	h=Date:From:To:Subject:From;
	b=ePRTAq0uXcAuzMXE3PpONQMgbcD6u+4Ok9ygfmSJChCWwUHt8cEVoSz1mqBouwsnV
	 Lp68DVmdOwCSzyEjRUfmUb30tTynMongTtk9hwBQzsXpsmLPXwOH27ViVkrKH9ZYfI
	 jtEwO+ee7zjlo+MOU8BU5TSqc5JrhyiXQaoCS4LqFmBbDpWvu9iCPrjm9FhPRFBSq3
	 yz99GV679lMs3llMAzwxylREeloVI2syCEI7uuGwSTZJjMIQwYkrETnDZ/bEx+28xI
	 cdVZKKJQBpNQCq643a57gLIB3WVqxUXlhmLXGeu1Xe8wY5bjFQSwhsGw4E7XQ3xe5A
	 ZSdXSeDNRblpA==
Date: Tue, 10 Jun 2025 12:46:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: tools@kernel.org
Subject: [b4] CRITICAL: prep-pre-flight-checks must be a list, got str
Message-ID: <20250610194624.GA1933519@ax162>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After commit 8cae108 ("Further mypy typing enhancements"), I am seeing
an error when running 'b4 send':

  $ b4 send
  Converted the branch to 1 messages
  CRITICAL: prep-pre-flight-checks must be a list, got str

The following diff appears to resolve it for me.

Cheers,
Nathan

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 0b24d50..df248bf 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2005,7 +2005,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
                         'needs-checking-deps': True,
                         'needs-auto-to-cc': True,
                         }
-            cfg_checks = config.get('prep-pre-flight-checks', 'enable-all')
+            cfg_checks = config.get('prep-pre-flight-checks', ['enable-all'])
             if not isinstance(cfg_checks, list):
                 logger.critical('CRITICAL: prep-pre-flight-checks must be a list, got %s', type(cfg_checks).__name__)
                 sys.exit(1)
