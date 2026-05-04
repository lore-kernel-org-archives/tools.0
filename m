Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E823563E8
	for <tools@linux.kernel.org>; Mon,  4 May 2026 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892970; cv=none; b=q7rOeASmXr4IKE3qMZaChdG0yQv/SqSAW5fhWfXeM6yn22cy7fvLc9MDtjvWeOC8pbPEG/DmK4Q5zs2C8fLF1sIMbkkJFlyeLQXHMEO7NMjo2uD8vG6DCmojmqtxJHvIx2rI6BwBt+gsLp29WrTUQHaWae7MlPtMKR+e3x+Htk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892970; c=relaxed/simple;
	bh=m5o4aGsY7HCyTIt8fJQLuNwocM3THopkNcjI+FgsSJA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=mR1arlvOPYGwnC2QUf03vKzMwvEBen7yYkz5TPJdRjq8K7wvGybc4RhVCyRN0w+lO1RTLNyCGfxweG5AsBf614MP7KJEpAyDvfq0NDHaL7hrf2OfIjrE6l08uiZYYLbV/MhfeCaLp8S4RiVPg2s9TSrz3J+RGXoB2Oa3qxC8C4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xzAR6vue; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jvC36Cd6; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xzAR6vue; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jvC36Cd6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xzAR6vue";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jvC36Cd6";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xzAR6vue";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jvC36Cd6"
Received: by smtp.kernel.org (Postfix)
	id 6540BC2BCB9; Mon,  4 May 2026 11:09:30 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AFEEC2BCB8
	for <tools@kernel.org>; Mon,  4 May 2026 11:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AFEEC2BCB8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from pobox.suse.cz (unknown [10.128.32.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73CCD6B11B;
	Mon,  4 May 2026 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777892967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VgCdAXo+4X+T/FMXSm3dKxCHo/Oj0GD6TiTfEt34F7g=;
	b=xzAR6vuecWXkuxSHY/Z2Nypr0eJt0mneU4Nc5vhyudr3tVDKU5QCgn7cts0o2CXfU3gA2K
	gUrSrsbMcB6YmCdrS3QRERI8+D9awr1ZpJdAdv/GSZahfqs9TJaaVhP6mO4pNlWU2vct/u
	vvowFrhYBfh974C7+Fd2cK9U8kmZJsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777892967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VgCdAXo+4X+T/FMXSm3dKxCHo/Oj0GD6TiTfEt34F7g=;
	b=jvC36Cd6HIUJ0SO2/SKGb4vLdcwwyYZT4UNQdEs2OCcd8qyeuipBpdZWOoLUF0ZHuKiwOM
	qjYJd/e22fWc3oDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777892967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VgCdAXo+4X+T/FMXSm3dKxCHo/Oj0GD6TiTfEt34F7g=;
	b=xzAR6vuecWXkuxSHY/Z2Nypr0eJt0mneU4Nc5vhyudr3tVDKU5QCgn7cts0o2CXfU3gA2K
	gUrSrsbMcB6YmCdrS3QRERI8+D9awr1ZpJdAdv/GSZahfqs9TJaaVhP6mO4pNlWU2vct/u
	vvowFrhYBfh974C7+Fd2cK9U8kmZJsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777892967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VgCdAXo+4X+T/FMXSm3dKxCHo/Oj0GD6TiTfEt34F7g=;
	b=jvC36Cd6HIUJ0SO2/SKGb4vLdcwwyYZT4UNQdEs2OCcd8qyeuipBpdZWOoLUF0ZHuKiwOM
	qjYJd/e22fWc3oDA==
Date: Mon, 4 May 2026 13:09:27 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: konstantin@linuxfoundation.org
cc: tools@kernel.org
Subject: b4 review tui - show range-diff for a patch
Message-ID: <alpine.LSU.2.21.2605041306360.26178@pobox.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.979];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pobox.suse.cz:helo,pobox.suse.cz:mid]
X-Spam-Flag: NO

Hi,

I have a feature wish. Would it be possible to show range-diff output for 
a patch in a series while reviewing it, please? I need to either quit the 
review and return to patches overview screen, or run range-diff manually 
in a different terminal. It would be nice to show a range-diff for a 
particular patch (as pop-up or something).

Thank you
Miroslav

