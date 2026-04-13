Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49031691A
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098993; cv=none; b=bN+Z1qqw3qE+kyAhXPUqnqkchkiQyB6COYB/sW1Jhzc8I1NrDH9f8RVr9ZQAGxXB+E/7IR8y9DZIYO29Efl5DDtRr4KIuKmHXXF9Z01ogTfpuRSGvIbjoHBU4J/7sZG3OaGyry6e9uiY0gu9f6nWPSZqiGBkqHO5mbz7y+jcF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098993; c=relaxed/simple;
	bh=FPR1h0L6wxU1HBmfoWtU7gZVdPgm7sp7oz9mjWk8Fr8=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=DRcLf5y/R6EYJtDKF+hmGBoQuWP45vwWrDDsHWGVATZbFhF2XFwcXLbtwW1ZvL6g9NJvmT5SUhsKRnvlqmgG5AHu7uz0ZQNb32dy1dLSd+Vk/S4q0cdMDU/s5vZZFKg0jUq7UWzERn/5/iSwD4pIUzLQGywyPtipxBKryvkIGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ahu8Cmw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ahu8Cmw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CE8C2BCB0
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776098993;
	bh=FPR1h0L6wxU1HBmfoWtU7gZVdPgm7sp7oz9mjWk8Fr8=;
	h=Date:From:To:Subject:From;
	b=Ahu8Cmw/ZDDBvFC2CMMMnU/f9qjE8vMU+HtVauOFqucz3PWzvX/xjrkLyvZMLr/3F
	 TtIROnUF5EhTZ9Sdetk+/N/yX072yVZtPJ9mi8OdzOkw4QGQ8fRvDvE2ETvFaKOwaU
	 Cdjj7gc6eECaPrNkTypCj9nIt3h3wMZsbwzT/gBDH+7N0/8ZY28t9S8smf0FTEFuY7
	 53/3Z3HPUGiIoO8aEzeNKVrSAL3kH93Enwsuj9eutxHRtxMQegNAjXoEW6cOgynl9V
	 V4I6O1l9Xo5Tgf4DeHJ0O79I+CF+uGcnnIUESTmS14vpF6DG3ZKwmbzGETeOcLl3/t
	 3LxQ1w/Ky+hmg==
Message-ID: <c1063b70-eb6e-4b2b-9c58-b0574e7fb9cd@kernel.org>
Date: Mon, 13 Apr 2026 18:49:51 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
To: tools@linux.kernel.org
Subject: unexpected warning about ignored trailers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

'b4 shazam 20260413230417835rnfiEWduEx44lc3u4uR9_@zte.com.cn' results in

Looking up https://lore.kernel.org/all/20260413230417835rnfiEWduEx44lc3u4uR9_@zte.com.cn/
Grabbing thread from lore.kernel.org/all/20260413230417835rnfiEWduEx44lc3u4uR9_@zte.com.cn/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 5 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  [PATCH v6] mm/slub: defer freelist construction until after bulk allocation from a new slab
---
Total patches: 1
---
NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Suggested-by: Harry Yoo (Oracle) <harry@kernel.org>
     Msg From: hu.shengming@zte.com.cn <hu.shengming@zte.com.cn>
NOTE: Rerun with -S to apply them anyway

'b4 am' doesn't result in this warning

The trailer it complains about is probably coming from v5 thread:
https://lore.kernel.org/all/20260413131423382u868NVr2RkcvDe0Ii3ERj@zte.com.cn/

But since the same trailer already exists in the v6 patch itself, the warning
doesn't seem necessary, the trailer makes it to the git commit anyway.

Thanks,
Vlastimil
