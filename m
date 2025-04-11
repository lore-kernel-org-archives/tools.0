Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A928FFF4
	for <tools@linux.kernel.org>; Fri, 11 Apr 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362738; cv=none; b=NKJcCJIuCEdgpZhnWUAqdZrIxPXMKClZQtLXNfE69eK3GsW15qf8dT4sqagQWJttdZyQZKmJlix+kXul436yXs1uLsW/3hswLJ/wOkw68/pk3PiNx77RLtBc3chs6MwRac7q0LuW6SPTFyicqlrBYmMXAK50xyJszLy4eNIzSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362738; c=relaxed/simple;
	bh=f9Yd6xCLMALM6ilJgfGPxK5UgQRyr7uNHZrWfj3PfPY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AON7+08MrLe0O57nFnGLbyopQwNm35sM2P88F3Go3zEl7dMpL6zxF3gSoFmMQykraN7xY+n4mB8TQFkU+LMSoeNW/k4uUaQwk3M3LtyrHqoDqEbHjmBgj3HLzieoxE06TmjQ+gbTNhJxzxuq7kmftYG7RVq1ZW7TfYCjPnFELGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=djsiEo0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="djsiEo0i"
Received: by smtp.kernel.org (Postfix)
	id 5BDDDC4CEEA; Fri, 11 Apr 2025 09:12:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE248C4CEE2
	for <tools@kernel.org>; Fri, 11 Apr 2025 09:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE248C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1368295f8f.0
        for <tools@kernel.org>; Fri, 11 Apr 2025 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744362732; x=1744967532; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvfqrezAtqR1hSxmoFrpJrj4BgZQvuTmtChkvVp5WNc=;
        b=djsiEo0iOMJoV+vUQQl/4BLIhFfcY4c+/qRlqr5odv+6QFZvkSYeyX96aAjFZGsm9g
         DpO+GdI5yQgiBVtqBhqrGPFyV26LfNYQVNPxZwSbTFmDOms0wbr21KQ7bX66+rOEkTf3
         QV1MZXPduhYYs8sIs4cKxHVM4ckWhtlqIac9ajARxGYrtd7oV1a2mObJkZyD7cI9qxO9
         Gb9xVYZLuAY9H0Rdp1dwdfxBYLSMqGNvtUA0crGIkQldm5tUOTnVMXbWDeAY52D7kQ6E
         a1GIiA+56fM/0Pw9BanaVXv7BTC8ykFH8RuXVeQ8bhmebHepzztemIIbTF6Sf0efPb0r
         8Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362732; x=1744967532;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uvfqrezAtqR1hSxmoFrpJrj4BgZQvuTmtChkvVp5WNc=;
        b=rZamdDqFrtWT92FjpQQUFLYTpuHRCcskrKJ5LaaxJofiCVlmDw8ZtTdinyxeZeHi09
         EzIB7nKa9P/R8jfmtjBwOh4fiERYQzpkfAm4jAruajExf/NC4clof6KFeSeq3VoEmsD/
         BLCfPSIbPuQoJivOBarPEpdfOBf+c8noVTaof+TKFBS/NZQB+w+nK5GkWGyE8X61dGkf
         YzAz7W/p3A9UUgZqdWSF8STpwenY/ydCx+V5fVr3tXqGmEdHg0B/AkQgxsxovrjmTh5B
         hhfrZq4B5NvRrkJXjAIY2HlxSeavCTovNmIPKaCVoK54ZMhoKOobtw66WnOGxxmXegA6
         Hw8w==
X-Gm-Message-State: AOJu0Yyj2J4h3/+2NWWC8tHtoPRfuyQ1Rj6qMa8dLaZVV40bywmKaihR
	/8Yw8D3s+dLoc2gdQII5lYnTiz0aN4oHHaz+JjlFifPBZ+y4DUd35tWtSCw6GdN3GghPZ/dH8o1
	n
X-Gm-Gg: ASbGncssUfKgCAjK6RMgIHB5QSkfyl064PkjkRQ/okssqvIL8N4y9a1DE54dLiYzyjO
	wP3hIFiXYdr4fqwjZs+Nsfot58KRQu2VEvNJfg7Glcf8fcZKohDkQhMZjQMyOtFwIyTFjijOl5w
	hErvFZdD/UMnReyK2qBAZnwzr31NluaI/ri4aFQibksCd/kkGg8pmuAa2baW/hOxxnpy54SF1Un
	BUzZWzd2g6jmrnDkAGULmx+B/f6onemeasqiOnpYLKzc55luiaa4oH/4LSj3HGIaBlGpzqJQMtf
	Nrpwc76kjtqyErlMGKkwlACuNgcEoOeNWmsFdTZ/oRXfuMylkekOBuHT2cp5X3lcLbosOvNlb4u
	SF+Y/KthHgpadNctU1X8qpjZQTkYxOfK88GYSi//e2N+1d0iNIIV7Wv9jD/hy/E53tf5yN5aN9y
	7mn07dyteYp55GEg==
X-Google-Smtp-Source: AGHT+IHTUUpRKP8d8NPcJDkxD8EIM89jIkxxNyRk8DTydLxkl5uSCBgKt0W8UBp/yB3q5TA14CClXg==
X-Received: by 2002:a5d:64af:0:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-39ea51ecdc7mr1422479f8f.12.1744362731627;
        Fri, 11 Apr 2025 02:12:11 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f1a:ea00:b220:7501:321e:5c31? (p200300ef2f1aea00b2207501321e5c31.dip0.t-ipconnect.de. [2003:ef:2f1a:ea00:b220:7501:321e:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm1409435f8f.96.2025.04.11.02.12.11
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:12:11 -0700 (PDT)
Message-ID: <c967f103-f6e5-4f2c-829a-b9e806f9075c@suse.com>
Date: Fri, 11 Apr 2025 11:12:10 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tools@kernel.org
From: Andrea Cervesato <andrea.cervesato@suse.com>
Subject: b4 send - missing patch in lore
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I used the "b4 send" command to send a patch-series via sendmail, but 
the below patch has been skipped by the ML service (lore/patchwork).
It never happened to me and this is the only patch-series with this problem.

As you can see here, everything is fine according to b4 send command:

Converted the branch to 5 messages
---
To: ltp@lists.linux.it
Cc: Andrea Cervesato <andrea.cervesato@suse.com>
---
   [PATCH v4 0/4] Support for Patchwork CI
   [PATCH v4 1/4] ci: install dependences for patchwork-ci script
   [PATCH v4 2/4] ci: add patchwork-ci script
   [PATCH v4 3/4] ci: add ci-patchwork-trigger workflow
   [PATCH v4 4/4] ci: apply patchwork series in ci-docker-build workflow
---
Ready to:
   - send the above messages to actual listed recipients
   - with envelope-from: Andrea Cervesato <andrea.cervesato@suse.de>
   - via SMTP server imap.suse.de
   - tag and reroll the series to the next revision

Press Enter to proceed or Ctrl-C to abort
Connecting to imap.suse.de:587
---
   [PATCH v4 0/4] Support for Patchwork CI
   [PATCH v4 1/4] ci: install dependences for patchwork-ci script
   [PATCH v4 2/4] ci: add patchwork-ci script
   [PATCH v4 3/4] ci: add ci-patchwork-trigger workflow
   [PATCH v4 4/4] ci: apply patchwork series in ci-docker-build workflow
---
Sent 5 messages
Tagging sent/20250410-patchwork_ci-7dc4ae02c40d-v4
Recording series message-id in cover letter tracking
Created new revision v5
Updating cover letter with templated changelog entries.
Invoking git-filter-repo to update the cover letter.
New history written in 0.06 seconds...
Completely finished after 0.12 seconds.

Also cover letter shows the patch 3/4 in the list, but, still, in 
lore/patchwork the patch 3/4 is not available:
https://patchwork.ozlabs.org/project/ltp/list/?series=452273
https://lore.kernel.org/ltp/20250411-patchwork_ci-v4-0-7f3c5ba298a1@suse.com/T/#t
I can confirm that smtp server has never had any issue so far and many 
people are using it on a daily basis.

Did you experienced something similar before?

Best regards,
Andrea Cervesato

-------- Forwarded Message --------
Subject:     [PATCH v4 3/4] ci: add ci-patchwork-trigger workflow
Date:     Fri, 11 Apr 2025 10:01:58 +0200
From:     Andrea Cervesato <andrea.cervesato@suse.de>
To:     ltp@lists.linux.it
CC:     Andrea Cervesato <andrea.cervesato@suse.com>


From: Andrea Cervesato <andrea.cervesato@suse.com>

Add ci-patchwork-trigger workflow that is meant to run every 30 minutes,
checking for new untested LTP patches in the Mailing List and running
the ci-docker-build workflow on them.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
.github/workflows/ci-patchwork-trigger.yml | 63 
++++++++++++++++++++++++++++++
1 file changed, 63 insertions(+)

diff --git a/.github/workflows/ci-patchwork-trigger.yml 
b/.github/workflows/ci-patchwork-trigger.yml
new file mode 100644
index 
0000000000000000000000000000000000000000..ff8e5606f17327f461e9aeec803fbffaac1b1a8f
--- /dev/null
+++ b/.github/workflows/ci-patchwork-trigger.yml
@@ -0,0 +1,63 @@
+# Copyright (c) 2025 Andrea Cervesato <andrea.cervesato@suse.com>
+
+name: "Patchwork checker"
+on:
+ push:
+ schedule:
+ - cron: '*/30 * * * *'
+
+env:
+ PATCHWORK_CI_FILE: patchwork-ci-output.txt
+
+jobs:
+ checker:
+ runs-on: ubuntu-latest
+ steps:
+ - name: Git checkout
+ uses: actions/checkout@v1
+
+ - name: Verify new patches
+ id: verify
+ run: |
+ ./ci/patchwork-ci.sh verify > "$PATCHWORK_CI_FILE"
+ cat "$PATCHWORK_CI_FILE"
+
+ - name: Run tests
+ if: success()
+ uses: actions/github-script@v7
+ with:
+ script: |
+ const fs = require('fs');
+
+ const output = fs.readFileSync(process.env.PATCHWORK_CI_FILE, 'utf8');
+ if (output.length === 0) {
+ console.log("'patchwork-ci.sh verify' output is empty");
+ return;
+ }
+
+ const lines = output.split('\n');
+ if (lines.length === 0) {
+ console.log("No new patch-series found");
+ return;
+ }
+
+ for (const data of lines) {
+ const [series_id, series_mbox] = data.split('|');
+ if (series_id.length === 0 || series_mbox.length === 0) {
+ console.log("Malformed data: ${data}");
+ continue;
+ }
+
+ const response = await github.rest.actions.createWorkflowDispatch({
+ owner: context.repo.owner,
+ repo: context.repo.repo,
+ ref: context.ref,
+ workflow_id: 'ci-docker-build.yml',
+ inputs: {
+ SERIES_ID: series_id,
+ SERIES_MBOX: series_mbox,
+ }
+ });
+
+ console.log(response);
+ }

-- 
2.43.0


