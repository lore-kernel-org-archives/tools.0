Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880D12C55D
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708958084; cv=none; b=amnLUjhHJAbsJz5XEmqTKhYz/J67FuG0CoJ4kmgbZkhjfl3L60Z8ptI7C4hlXjVf/eewLCdqqyCo9lxzH7A3jmksmM8MLUgGeeT58TWpYDcCYF941YGRVulwNLuVZ99gajBS4+r+grTYzkvs1Qexbh6O/hyvQqLM6+qM2F5jMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708958084; c=relaxed/simple;
	bh=1AwVLx37C9wY/4E9YKtZHuXf45SBViewNZvGNPIxAzw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=W8oqlSfydyBLRvKC756BuqDuBaC/HlcBalzhAG2B4zQqdxdae6Ixu9zHZx7jEvJC+/43+kJJoFDf4Mdqsgyqk+ItA+SvV5Rj7fXQtCSls7NzQH6Y+SxOugLg+UMUBVtUXDHjrjR0KfZfCNq4K12eeNSa0ga/nntz47gYYkmKsGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=fD8ramOC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8+J+K2WV; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=fD8ramOC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8+J+K2WV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="fD8ramOC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8+J+K2WV";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="fD8ramOC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8+J+K2WV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5E56224F2
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708958080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AwVLx37C9wY/4E9YKtZHuXf45SBViewNZvGNPIxAzw=;
	b=fD8ramOCWCo31HHk6FBUcoMb3eQ+2lGYsn1Ooez+c2YYweceXn4u4/CNFFEOOHgb1sG9OG
	5s7pMeyh+ehIOSiEWLwibvUjIvmCHlw8VSxX9hT+SvNQdzBYzhLJbJioWUJ9Gug85pFvPz
	aQ4TcC/ustbGLf5kHdS32VbTo6pf0iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708958080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AwVLx37C9wY/4E9YKtZHuXf45SBViewNZvGNPIxAzw=;
	b=8+J+K2WVUvPBsYr5UlHmOd9AsLXaof2wZmy3trkfkFZH8WxBFB8lI9aAApeM1CkeRLdYB8
	84V+zB5pG8LuISAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1708958080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AwVLx37C9wY/4E9YKtZHuXf45SBViewNZvGNPIxAzw=;
	b=fD8ramOCWCo31HHk6FBUcoMb3eQ+2lGYsn1Ooez+c2YYweceXn4u4/CNFFEOOHgb1sG9OG
	5s7pMeyh+ehIOSiEWLwibvUjIvmCHlw8VSxX9hT+SvNQdzBYzhLJbJioWUJ9Gug85pFvPz
	aQ4TcC/ustbGLf5kHdS32VbTo6pf0iY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1708958080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AwVLx37C9wY/4E9YKtZHuXf45SBViewNZvGNPIxAzw=;
	b=8+J+K2WVUvPBsYr5UlHmOd9AsLXaof2wZmy3trkfkFZH8WxBFB8lI9aAApeM1CkeRLdYB8
	84V+zB5pG8LuISAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91F8513A58
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 14:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wVY+I4Ch3GVfcAAAD6G6ig
	(envelope-from <vbabka@suse.cz>)
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 14:34:40 +0000
Message-ID: <82bdf374-b96e-4cc8-995b-addfbab91dec@suse.cz>
Date: Mon, 26 Feb 2024 15:34:40 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
To: tools@linux.kernel.org
Subject: b4 using specified base-commit yet still fails to apply?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.55
X-Spamd-Result: default: False [-2.55 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_NONE(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-2.26)[96.53%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 PREVIOUSLY_DELIVERED(0.00)[tools@linux.kernel.org];
	 RCPT_COUNT_ONE(0.00)[1];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Hi,

When I do:

git checkout v6.8-rc1

b4 shazam https://lore.kernel.org/all/20240221194052.927623-1-surenb@google.com/

I can see it detects the base commit (which is v6.8-rc5+)

 Base: using specified base-commit 39133352cbed6626956d38ed72012f49b0421e7b

but eventually fails to apply something:

Applying: mm: create new codetag references during page splitting
Patch failed at 0019 mm: create new codetag references during page splitting

If I do first

git checkout 39133352cbed6626956d38ed72012f49b0421e7b

then it applies cleanly. Is the base-commit handling buggy?

Thanks,
Vlastimil
