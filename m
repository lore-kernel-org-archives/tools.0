Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6127F4EB
	for <tools@linux.kernel.org>; Tue,  4 Mar 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102967; cv=none; b=Jnhsh8Eb0vnRlVpb4+SKze5FcypliwGPlIvoVAToz4N1jzYTsdDwT5jyEKbnQbvFPOulI6W0beb7O4/udeftwm5fHxYp0Iu46vcKkuFBXlKxCW/VbzgE7sTFWmstpbipaUzLFC4hY5fBS1iF7kZLhsQOhpwZ0nAe9tIPb9nW6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102967; c=relaxed/simple;
	bh=Hgyvrd2M8ovlu8rruF/YzeJzHS2Nj7Xn7CKSBBTd1PA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=XfGQrj38AjTdNVj2s2h8wddMrrtfSSf//chQwSIrCY0ywRytkVxXA/zNKdBBeZz+4AOb4rgirOW3MKs0bXLNUt3umjuLa6wEL4DsMwUU8CXASeH0QyujtsOf847ePGFNEjdvvnQw3gNEHL1hb8B2nUFa95obWVD/fHl3a0xujZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Q7uHTMMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Q7uHTMMl"
Received: by smtp.kernel.org (Postfix)
	id 1DAA8C4CEE7; Tue,  4 Mar 2025 15:42:47 +0000 (UTC)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7382C4CEE5
	for <tools@kernel.org>; Tue,  4 Mar 2025 15:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7382C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4Z6g156p8hz1Fb37;
	Tue,  4 Mar 2025 16:42:33 +0100 (CET)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4Z6g155HTmz1DHYN;
	Tue,  4 Mar 2025 16:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1741102953;
	bh=inWFwMm3bo0oVzPWJFrD/Ye+qVZB0v6kllKaPUZXHBc=;
	h=Date:From:Subject:To;
	b=Q7uHTMMlMmyKoRcAZ4pht9OeVjTquM9EUymJGqnNrwm8AmXF5aI4uGL0ZT0FhfVkp
	 cV7bjs10DzmdU9C6Ox30EDg9mB1q9uHhaqnFW4CGrMIWlWFgBW+bILHcfbE23X5T1U
	 UPF3EIMcg0BxbUejeCVIRBugPykkUGkTawr89JbU=
Message-ID: <5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com>
Date: Tue, 4 Mar 2025 16:42:33 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
Subject: b4 am getting extra patches and missing patches
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

First of all, thank you for the wonderful tool that b4 is!


I am trying this with b4 version 0.14.2 (as well as using current
master), getting this strange result:

----%<----
$ b4 am https://lore.kernel.org/all/20250218-jag-mv_ctltables-v1-0-cd3698ab8d29@kernel.org/T/#m6e83d4c31cffc76f16d830bbb79c9e3efd1e4d89 
Analyzing 17 messages in the thread
WARNING: duplicate messages found at index 1
   Subject 1: perf/core: Move perf_event sysctls into kernel/events
   Subject 2: panic: Move panic ctl tables into panic.c
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: x86: Move sysctls into arch/x86
   Subject 2: perf/core: Move perf_event sysctls into kernel/events
  2 is not a reply... assume additional patch
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH] x86: Move sysctls into arch/x86
    ✓ Signed: DKIM/linutronix.de
  ✓ [PATCH] perf/core: Move perf_event sysctls into kernel/events
    ✓ Signed: DKIM/linutronix.de
  ✗ [PATCH 3/8] ftrace: Move trace sysctls into trace.c
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
    + Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
  ✗ [PATCH 4/8] stack_tracer: move sysctl registration to kernel/trace/trace.c
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
  ✗ [PATCH 5/8] events: Move perf_event sysctls into kernel/events
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
    + Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org> (✓ DKIM/infradead.org)
  ✗ [PATCH 6/8] sparc: mv sparc sysctls into their own file under arch/sparc/kernel
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
  ✗ [PATCH 7/8] s390: mv s390 sysctls into their own file under arch/s390 dir
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
  ✗ [PATCH 8/8] x86: Move sysctls into arch/x86
    ✗ BADSIG: openpgp/joel.granados@kernel.org
    ✓ Signed: DKIM/kernel.org
  ERROR: missing [9/8]!
  ERROR: missing [10/8]!
---
Total patches: 8
---
WARNING: Thread incomplete!
Cover: ./20250218_joel_granados_sysctl_move_sysctls_from_kern_table_into_their_respective_subsystems.cover
 Link: https://lore.kernel.org/r/20250218-jag-mv_ctltables-v1-0-cd3698ab8d29@kernel.org
 Base: using specified base-commit 0ad2507d5d93f39619fc42372c347d6006b64319
       git checkout -b 20250218_joel_granados_kernel_org 0ad2507d5d93f39619fc42372c347d6006b64319
       git am ./20250218_joel_granados_sysctl_move_sysctls_from_kern_table_into_their_respective_subsystems.mbx
----%<----


The two first patches are not actually from the email thread, but
replaces the first two patches that are in the email thread.


Using --single-message on the first patch of the thread does not work
either:

----%<----
$ b4 am --single-message https://lore.kernel.org/all/20250218-jag-mv_ctltables-v1-0-cd3698ab8d29@kernel.org/T/#m76f58f40fe66b018d8f86485b46e07bdf1bec99e
Single-message mode, ignoring any follow-ups
Analyzing 1 messages in the thread
No patches found.
----%<----


I am not sure what to make of this.

Cheers,
Andreas
