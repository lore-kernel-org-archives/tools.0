Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A07D8A3
	for <tools@linux.kernel.org>; Tue, 12 Dec 2023 17:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Uv1s+7fP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XbfRRZWg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Uv1s+7fP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XbfRRZWg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6746521B35
	for <tools@linux.kernel.org>; Tue, 12 Dec 2023 17:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702402070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G69dfzk7MnLVYbykiH05dZFNksaxFjBmnSsO/+IHOy8=;
	b=Uv1s+7fP3LHoclzNiNiTmX2USoSloBZGZWVbsZ+IbglNOH/XMQs3y9OqP+nxkhp1w+05u6
	296uIg40SB5HwkTt/DYDF4bzrZ0ZX+TQp/g+qzX4EH8pO75jQbo35E4SkHfgnpZk1bnW0t
	lkfdjH1OXkbii4yhmnB9rqZb6LbwypM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702402070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G69dfzk7MnLVYbykiH05dZFNksaxFjBmnSsO/+IHOy8=;
	b=XbfRRZWgtRCh7HBzGbOn1Y9xaelIxODUY1YdAZwdt+lpJVuVrrmoF93abo5XUgJWN9POc0
	HYeGEKI2W33CKSDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702402070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G69dfzk7MnLVYbykiH05dZFNksaxFjBmnSsO/+IHOy8=;
	b=Uv1s+7fP3LHoclzNiNiTmX2USoSloBZGZWVbsZ+IbglNOH/XMQs3y9OqP+nxkhp1w+05u6
	296uIg40SB5HwkTt/DYDF4bzrZ0ZX+TQp/g+qzX4EH8pO75jQbo35E4SkHfgnpZk1bnW0t
	lkfdjH1OXkbii4yhmnB9rqZb6LbwypM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702402070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G69dfzk7MnLVYbykiH05dZFNksaxFjBmnSsO/+IHOy8=;
	b=XbfRRZWgtRCh7HBzGbOn1Y9xaelIxODUY1YdAZwdt+lpJVuVrrmoF93abo5XUgJWN9POc0
	HYeGEKI2W33CKSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F50713725
	for <tools@linux.kernel.org>; Tue, 12 Dec 2023 17:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /4XqFhaYeGXuOwAAD6G6ig
	(envelope-from <vbabka@suse.cz>)
	for <tools@linux.kernel.org>; Tue, 12 Dec 2023 17:27:50 +0000
Message-ID: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
Date: Tue, 12 Dec 2023 18:27:50 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: tools@linux.kernel.org
From: Vlastimil Babka <vbabka@suse.cz>
Subject: b4 send suggestion: handle .git_aliases
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.33
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.23
X-Spamd-Result: default: False [-2.23 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.93)[86.38%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 PREVIOUSLY_DELIVERED(0.00)[tools@linux.kernel.org];
	 TO_DN_NONE(0.00)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.984];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

Hi,

It would be nice if b4 send --to/cc used .git_aliases
and also if something malformed is given to it (such as an alias it doesn't
handle now), warn instead of just dropping it silently.

Thanks!
Vlastimil
