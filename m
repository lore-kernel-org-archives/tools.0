Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8870
	for <tools@linux.kernel.org>; Tue, 11 May 2021 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620759677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zj2/XQU4aJZZugCnoaE0qq5nRKLb0bwyQMFlZ4CN5CI=;
	b=IOflcZdsQf+UOxRzrqJ//kE2Yhuw7pqrQiEX3NUAi70Usg1FFYUHdwi9/+JPNn1bYXk3Ly
	uyZL/hJUupLs20zFiPgCqpUiWAdXMErtXqKqGaPRV/99fccy865LKMRhkmmVT+vSjvqlzb
	lL02lC2brblYnwgB44eTgiKWjJioI6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-JO4yM7pwPwixHH3oUsBKtQ-1; Tue, 11 May 2021 15:01:14 -0400
X-MC-Unique: JO4yM7pwPwixHH3oUsBKtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D332B800D62
	for <tools@linux.kernel.org>; Tue, 11 May 2021 19:01:13 +0000 (UTC)
Received: from localhost (ovpn-118-47.rdu2.redhat.com [10.10.118.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A22545D9C0
	for <tools@linux.kernel.org>; Tue, 11 May 2021 19:01:13 +0000 (UTC)
Date: Tue, 11 May 2021 15:01:12 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: tools@linux.kernel.org
Subject: b4 ignoring patch 1/2 on series
Message-ID: <20210511190112.u724u6roghnfx432@habkost.net>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I'm trying to understand why b4 is ignoring patch 1/2 in the
following series:
https://lore.kernel.org/qemu-devel/20210430134830.254741-1-ckuehl@redhat.com/

I see in the debugging output that b4 recognize both patches, but
only the second patch is written to the mailbox.  Does anybody
understand why?

I'm running b4 directly from latest git, version 0.7.0-dev-31348.

Debugging output:

$ ./b4.sh -d am 20210430134830.254741-1-ckuehl@redhat.com
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp get-lore-mbox\..*
Running git --no-pager config -z --get-regexp gpg\..*
Looking up https://lore.kernel.org/r/20210430134830.254741-1-ckuehl%40redhat.com
t_mbx_url=https://lore.kernel.org/qemu-devel/20210430134830.254741-1-ckuehl%40redhat.com/t.mbox.gz
Grabbing thread from lore.kernel.org/qemu-devel
Using cached copy: /home/ehabkost/.cache/b4/22f427a5006fcd1691c1a76d7d48f203d05b4cb8.pi.mbx
Looking at: 20210430134830.254741-3-ckuehl@redhat.com
Kept in thread: 20210430134830.254741-3-ckuehl@redhat.com
Looking at: 20210430134830.254741-1-ckuehl@redhat.com
Kept in thread: 20210430134830.254741-1-ckuehl@redhat.com
Looking at: 20210430134830.254741-2-ckuehl@redhat.com
Kept in thread: 20210430134830.254741-2-ckuehl@redhat.com
Looking at: 4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com
Kept in thread: 4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com
Analyzing 4 messages in the thread
Looking at: [RESEND] sev: add missing firmware error conditions
  adding as patch
Looking at: [RESEND] SEV firmware error list touchups
  adding to unknowns
Looking at: [RESEND] sev: use explicit indices for mapping firmware error codes to strings
  adding as patch
Looking at: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
  adding to followups
Analyzing follow-up: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups (philmd@redhat.com)
  no trailers found, skipping
---
Writing ./20210430_ckuehl_sev_firmware_error_list_touchups.mbx
Running git --no-pager config -z --get-regexp user\..*
Calculating hashes for: [RESEND] sev: add missing firmware error conditions
Running git --no-pager patch-id --stable
Running git --no-pager mailinfo --encoding=UTF-8 /tmp/tmpryg0ngwz /tmp/tmpml12him7
DNS-lookup: mimecast20190719._domainkey.redhat.com.
DKIM signature did NOT verify
Retrying with the next DKIM-Signature header, if any
No DKIM-Signature headers in the message
  [RESEND] sev: add missing firmware error conditions
    . Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
    . Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Total patches: 1
Running git --no-pager rev-parse --show-toplevel
---
Cover: ./20210430_ckuehl_sev_firmware_error_list_touchups.cover
 Link: https://lore.kernel.org/r/20210430134830.254741-1-ckuehl@redhat.com
 Base: not found
       git am ./20210430_ckuehl_sev_firmware_error_list_touchups.mbx
Wrote 20210430_ckuehl_sev_firmware_error_list_touchups.am for thanks tracking



-- 
Eduardo

