Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601337;
	b=dNwSEdCqfOn1M8WZsy4OP0PILosS7mTDbGNKoA5+VqPfTSQtfwnYHFdiGny8kPRE1CqB
	 mUK9bCO/OJD8hytxKsIdlXvgu3k4aYZuCT+LBC+sJNAENUtq310A0ixhiUbrQEPTtmiQ9
	 PXXS8AK6TSaivlJuSQkJBR8mpx9qID6anjTZHmGHfLT1HWMJBf7lJtGyuvUYsr4/Xz9n4
	 O++HK36KXC24Nhkr/znQ8YpVcDJOEqI4hy3zF4O9+bayu1xUyOLIOFrg+wqY2w98zf2/G
	 nKABUluy4bbawikZWCetH0hle38yd3PPuxhesnx5uwk1SRTK5TEpu8NHINzfDmze64Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601337;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=QSU13btJuFZoC+qp8ThHhElAYdheIao/LiXzKFqCd+0=;
	b=ptuhWauMIh/MD5ZDg9xzirfelSfuALbMwY7MakNn2IuI+OBE9OMcT59O2pTfFcCLT3xN
	 Y5zAN+3713DyTwFVuLr8OnHs2m2X2VGVEsn1WS9dohOCx4FeppPsV8Jf7geOI87GmRVrr
	 q1lOsgshVkMCzRs1C0U5xuHV1VsgUkvLAuSL49rF/K7wPM0ZVJD9/HhRdFtPPHdSHxBZP
	 qYFRvr7XuCPLkaZlQaIsgDOgbKJgQswzCj2xIpGs+tslylUm78znfIHR6r19UuJfex/qu
	 s1uslluKqAdj9kuwmRZOufVhkecqk2N7LLtAHxPmRhtjetcXy/SFkhLqkk4vMiwcLvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgthkBdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27A606A33B
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgthkBdZ
Received: by smtp.kernel.org (Postfix)
	id 3EE4C1F000C9; Fri, 13 Nov 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794601337;
	b=Q3loNlmoNYhcvnF+4nYkSI5tozXmxchqj3Fw82y81gSV1BXwo5mttJUaF3wmMT7oI8Ap
	 U/Qa0YWI5i2Dbc/7R8D1HnBw3yycRCe8wETx9EhV4/qDeK5OhcPBDA0Xpi3z529UYXWaL
	 3Eh6YpxpORVi+eAbvqpftA4GjWm4qOZ6Vx+nGAMxNmY7RTvs/NtgcdKQAjLb2+hLU+KaL
	 3MS+UHmIsXxbrbmQgJJUkKcx5U6TK3lfbFlEklRrenR1aAimte6fk0cPNZ18VmiGVHFcx
	 TyMm7qezMag7wCBeKf+04rfG47Y/agLQImoX8mtiUnJd7BzroH4cJ3mU1k8poAJ7DWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QSU13btJuFZoC+qp8ThHhElAYdheIao/LiXzKFqCd+0=;
	b=m6MWXu8OjLojKaaFLNpK0fMLnW4B2iQ1UF1FPD7l7sL7Ye6+31fhpjQFsXhyLCr7bnon
	 w1OHFVrcRppVOBwGcSRrNbmZd5+DRQNpgJ1O3Wdpd+O7QZIdD3936uUq+7I6sLMZ2h5Me
	 0B0Qh4ZhSv5GbgBuRCyTlF1kPGmDP1uqDoJeaLt3vtiRN0Yyw870KX/WVUjovv7CFO8g3
	 RlIhNECnq4fXDFaboOMoAgndKFDRy+xYJhmBQA9XB6+mqVLHS4ZozG2pQuM1WmlbHtaQ5
	 +9viZwtLfUU2+E7UnO0RCs2tyoh49hnF/qlKNGF+pOF20M+vmUZR8RUNgQI2ZGlawlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgthkBdZ;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 303F91F000CD
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mgthkBdZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 303F91F000CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8451a619da7so1662185a34.1
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601334; x=1795206134; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSU13btJuFZoC+qp8ThHhElAYdheIao/LiXzKFqCd+0=;
        b=mgthkBdZ83QSaEM3NZCZWVBknEH6760BAaF65hzkiKUweyLaQqCjkuis91q9GXqmkj
         LodqTrAci/VkDv6O+qZQJ/j6WBhCtQlkAvZ8Y+f0BVdK3Y2OhZI2PCuZv59aSFQND76H
         gTCtzMuRLxhSEGpOQ3nx4cYKeZWOpZmL/YN3Uu8y/CEwsY6wUaku+TNscVadkXEt6ykF
         yOGSosfX5Am1MphN1GfCrdqyA3nsCDZIcbRXK20sAEz5O/Ja4DMYlFOhDpCI0AXAttEy
         i3+yGOKptkIRM/uIaTw4m+ut+OpHY3u4vG5taCBqqM3hC4n2ao4PJFsjO8uaaE6p4tIL
         +/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601334; x=1795206134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSU13btJuFZoC+qp8ThHhElAYdheIao/LiXzKFqCd+0=;
        b=i89XFFfHlYbXWDvnN/BpvxFkJ0Bm/M+B1gdZOt/bszhTx8ruIeuAE8LDHpnjz1s6Cu
         6sAhh7cyFQro0sO1S1jRGM1i68nBF2LFRb63S+rS5VKhMUPnT3vRBQB2NNRAHZhOwHER
         4C1Bqb75Tv3FlVuWuZmXcBeUqWINZr8bV5HPo9zc6qyVPAPw+EbDIq884FIugYh/1st1
         d+0UuYnHKOZ+4DazyJDpq+2kAKqLXxMNcn7eONax+KBImL0/crO/DBqn9jVyP6QreTIb
         yuztO+11W483j0T4+45ijtXZQ+Pfxuk0dMkIlONCaEjnPRckzOJR3wk5h1JfvnmX7Wa/
         AKAQ==
X-Gm-Message-State: APuU4Z+O/oJDOYTPIWyO6mzBAvMfRbbvseI3wrQeOm6pTkGsBZ7TTTj9
	0GHH9oO4m5dN7Uqio/gyPVDSsKKB5zUjh0XEycrBDpDmRwd/gBDOqL6O0Y3SEcY8
X-Gm-Gg: AYBFou1dTu2VlaGLFj8vnh8sZtq55kmvyFVostLn2F56RPGhacYq0I8+BmGkxVNgnwX
	+kfABPzmcYoezmnq4kpsXHX/5W7JGzHyJPQblLUNiiq2K3z6DU58sho8p3+Bh5HZcP689me3YR/
	dRQ2rsSWpOb6OuIsnp1tMONMkyWG+Q+9HRfaI+NBT8dBiioPYD6a8eaohWLwnTbaypjqsdcZVj/
	1+52eIOxmu1oO9Yx/EzFQsDft+dqbFgnNMktXgMOOk0Wl3vI7oI9AmU/YRFLL/tC7rVLrDd95YG
	7aCkE+OlqmxQzgrbxgAunoolh3v6xGY7Pccf1CUExHGSM/GFN1e06Xq4hXY1O3DgM5OUoGcEaCW
	UQEvaQitCXXI54F00Hh56NzlHW/DusopRIF8Gy9S4+sTREO4NftfRZBwv0Mk1QPm3kmOfsdICtC
	ZmHG/cRSMb7plnkQ+32kCvA+KQVJdCpXBcMnsSdpcV+NIHb9/2EYbbFyBk2Kmz883wpADRUCKHS
	CA68hhKeQKpOai5XZmdEHITD+3oPYOvkfxJr3WfKGmvjZ6AIwzpphumy0nx9QsdMci7G/Vtoti8
	vFlHJEiSex9dutt6flA7KVldw8AIFqMPMQNFtMpIQCOivKSY2Z8UXgDiE988fYOq9cpVf1B3tFS
	1jV/v9lDv7wiq0y9pmniUhwS9N5klzEvCSs+960B7udW+7u6jlxJ/k+ootp4O7v/1AgiwtOSh4n
	n/VidgoJtwNJ3AHH+vlJ/gBQaT6eP0Mn42TlNqce962NKtx0eDpfU=
X-Received: by 2002:a05:6830:6416:b0:81d:8057:9b7f with SMTP id 46e09a7af769-8628990f5d2mr3470515a34.28.1794601333951;
        Fri, 13 Nov 2026 12:22:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e98ebsm3585809a34.12.2026.11.13.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 13:02:16 -0700
Subject: [PATCH b4 3/5] send: persist SMTP submission progress
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-submit-b4-send-resume-v1-v1-3-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

An SMTP batch can stop after accepting only some messages or recipients.
Rebuilding the batch for another attempt loses both the original signed
messages and the delivery progress needed to avoid duplicates.

Add a private submission journal containing the prepared wire messages,
original envelope and per-recipient acceptance state. Persist an in-flight
marker before attempting delivery and record each known result before
continuing. Keep accepted recipients out of subsequent attempts.

Distinguish explicit rejections and connection-setup failures from uncertain
outcomes. A lost response or interrupted journal update requires explicit
reconciliation before the affected transaction can be tried again.

Use atomic, fsynced snapshots and validate saved message hashes before
opening a connection. Store the journal under the common Git directory so
it survives cache expiry and can be protected across linked worktrees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/b4/_send.py               | 322 ++++++++++++++++++++++++++++++
 src/tests/test_send_resume.py | 443 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 765 insertions(+)

diff --git a/src/b4/_send.py b/src/b4/_send.py
new file mode 100644
index 0000000..f27ee22
--- /dev/null
+++ b/src/b4/_send.py
@@ -0,0 +1,322 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""Durable SMTP submissions. Callers hold the series lock through rerolling.
+
+Messages are stored after signing and are never rendered again on resume.
+An in-flight marker reaches disk before SMTP DATA can be accepted. If the
+outcome cannot be recorded, another invocation must reconcile it explicitly.
+"""
+
+import hashlib
+import json
+import os
+import re
+import smtplib
+import tempfile
+from dataclasses import asdict, dataclass, field
+from email.parser import BytesParser
+from pathlib import Path
+from typing import Any, Dict, List, Optional, Sequence, Set, Tuple
+
+import b4
+
+
+class RetryableSendError(RuntimeError):
+    """A transport failure with durably recorded, unambiguous progress."""
+
+
+def _sync_dir(directory: Path) -> None:
+    fd = os.open(directory, os.O_RDONLY | os.O_DIRECTORY)
+    try:
+        os.fsync(fd)
+    finally:
+        os.close(fd)
+
+
+def _write(path: Path, data: bytes) -> None:
+    """Replace a snapshot durably; a failed update leaves the old one usable."""
+    fd, temporary = tempfile.mkstemp(prefix='.tmp-', dir=path.parent)
+    try:
+        with os.fdopen(fd, 'wb') as stream:
+            stream.write(data)
+            stream.flush()
+            os.fsync(stream.fileno())
+        os.replace(temporary, path)
+        _sync_dir(path.parent)
+    finally:
+        if os.path.exists(temporary):
+            os.unlink(temporary)
+
+
+def series_directory(change_id: str) -> Path:
+    common = b4.git_get_common_dir(b4.git_get_toplevel())
+    if common is None:
+        raise RuntimeError('Cannot locate the repository for send state')
+    # Neither a branch name nor an imported change-id is a pathname.
+    key = hashlib.sha256(change_id.encode()).hexdigest()
+    return Path(common) / 'b4-send' / key
+
+
+def _check_text(value: object) -> None:
+    if not isinstance(value, str) or not value:
+        raise ValueError('Invalid send metadata')
+
+
+def _check_addresses(value: object) -> None:
+    if (
+        not isinstance(value, list)
+        or any(
+            not isinstance(addr, str) or not addr or any(c in addr for c in '\r\n')
+            for addr in value
+        )
+        or len(set(value)) != len(value)
+    ):
+        raise ValueError('Invalid recipient list')
+
+
+@dataclass
+class Message:
+    message_id: str
+    subject: str
+    recipients: List[str]
+    sha256: str
+    accepted: List[str] = field(default_factory=list)
+
+    def pending(self) -> List[str]:
+        return [addr for addr in self.recipients if addr not in self.accepted]
+
+
+@dataclass
+class State:
+    change_id: str
+    revision: int
+    branch: str
+    head: str
+    tree: str
+    cover_hash: str
+    tag_message: str
+    cover_message_id: str
+    fromaddr: str
+    messages: List[Message]
+    schema: int = 1
+    in_flight: Optional[int] = None
+    finished: bool = False
+    next_cover: Optional[str] = None
+    next_tracking: Optional[Dict[str, Any]] = None
+    partial_reroll_hash: Optional[str] = None
+
+
+class SendSession:
+    def __init__(self, directory: Path, state: State) -> None:
+        self.directory = directory
+        self.state = state
+
+    @classmethod
+    def prepare(
+        cls,
+        directory: Path,
+        state: State,
+        messages: Sequence[Tuple[Set[str], bytes, b4.LoreSubject]],
+    ) -> 'SendSession':
+        if (directory / 'state.json').exists():
+            raise RuntimeError(f'A send is already recorded in {directory}')
+        # Keep signed mail and recipient lists private, including in shared repos.
+        for path in (directory.parent.parent, directory.parent, directory):
+            path.mkdir(mode=0o700, exist_ok=True)
+            _sync_dir(path.parent)
+        session = cls(directory, state)
+        for index, (recipients, data, subject) in enumerate(messages):
+            data = re.sub(rb'\r\n|\n|\r(?!\n)', b'\r\n', data)
+            msg = BytesParser(policy=b4.emlpolicy).parsebytes(data, headersonly=True)
+            message_id = b4.LoreMessage.get_clean_msgid(msg)
+            if not message_id or not recipients or msg.get('Bcc'):
+                raise RuntimeError(
+                    'Cannot save a message without an ID/recipients or with Bcc'
+                )
+            state.messages.append(
+                Message(
+                    message_id=message_id,
+                    subject=subject.full_subject,
+                    recipients=sorted(recipients),
+                    sha256=hashlib.sha256(data).hexdigest(),
+                )
+            )
+            _write(session.message_path(index), data)
+        session.validate()
+        session.save()
+        return session
+
+    @classmethod
+    def load(cls, directory: Path) -> 'SendSession':
+        try:
+            data = json.loads((directory / 'state.json').read_text())
+            data['messages'] = [Message(**entry) for entry in data['messages']]
+            session = cls(directory, State(**data))
+            session.validate()
+        except (OSError, ValueError, TypeError, KeyError) as exc:
+            raise RuntimeError(f'Cannot read send state in {directory}: {exc}') from exc
+        return session
+
+    def validate(self) -> None:
+        state = self.state
+        if state.schema != 1 or not state.messages or type(state.revision) is not int:
+            raise ValueError('Invalid send state version or message list')
+        if state.revision < 1 or type(state.finished) is not bool:
+            raise ValueError('Invalid send revision/status')
+        for value in (
+            state.change_id,
+            state.branch,
+            state.head,
+            state.tree,
+            state.cover_hash,
+            state.tag_message,
+            state.cover_message_id,
+            state.fromaddr,
+        ):
+            _check_text(value)
+        seen: Set[str] = set()
+        for index, message in enumerate(state.messages):
+            for value in (message.subject, message.sha256, message.message_id):
+                _check_text(value)
+            if message.message_id in seen:
+                raise ValueError('Invalid or repeated Message-ID')
+            seen.add(message.message_id)
+            for addresses in (message.recipients, message.accepted):
+                _check_addresses(addresses)
+            if not message.recipients or not set(message.accepted) <= set(
+                message.recipients
+            ):
+                raise ValueError('Accepted recipients are not part of the submission')
+            msg = BytesParser(policy=b4.emlpolicy).parsebytes(
+                self.message_bytes(index), headersonly=True
+            )
+            if b4.LoreMessage.get_clean_msgid(msg) != message.message_id:
+                raise ValueError('Saved Message-ID differs from the wire message')
+        if state.cover_message_id != state.messages[0].message_id:
+            raise ValueError('Submission root differs from the saved first message')
+        if state.in_flight is not None:
+            if (
+                type(state.in_flight) is not int
+                or not 0 <= state.in_flight < len(state.messages)
+                or not state.messages[state.in_flight].pending()
+            ):
+                raise ValueError('Invalid in-flight delivery')
+        if state.finished and (not self.delivered() or state.in_flight is not None):
+            raise ValueError('Unfinished delivery marked complete')
+        if any(
+            value is not None
+            for value in (
+                state.next_cover,
+                state.next_tracking,
+                state.partial_reroll_hash,
+            )
+        ):
+            _check_text(state.next_cover)
+            _check_text(state.partial_reroll_hash)
+            if not isinstance(state.next_tracking, dict) or not self.delivered():
+                raise ValueError('Invalid saved reroll')
+
+    def message_path(self, index: int) -> Path:
+        return self.directory / f'{index:04d}.eml'
+
+    def message_bytes(self, index: int) -> bytes:
+        data = self.message_path(index).read_bytes()
+        if hashlib.sha256(data).hexdigest() != self.state.messages[index].sha256:
+            raise ValueError(f'Saved message changed: {self.message_path(index)}')
+        return data
+
+    def save(self) -> None:
+        _write(
+            self.directory / 'state.json',
+            (json.dumps(asdict(self.state), indent=2) + '\n').encode(),
+        )
+
+    def delivered(self) -> bool:
+        return all(not message.pending() for message in self.state.messages)
+
+    def resolve(self, outcome: str) -> None:
+        index = self.state.in_flight
+        if index is None:
+            raise RuntimeError('There is no uncertain delivery to resolve')
+        if outcome not in ('sent', 'unsent'):
+            raise ValueError('Invalid delivery outcome')
+        if outcome == 'sent':
+            message = self.state.messages[index]
+            message.accepted = list(message.recipients)
+        self.state.in_flight = None
+        self.save()
+
+    def send(self, smtp: b4.SMTPConnector) -> None:
+        if self.state.in_flight is not None:
+            message = self.state.messages[self.state.in_flight]
+            raise RuntimeError(
+                f'Delivery of <{message.message_id}> is uncertain. Check the server/list, '
+                'then use --resume --resolve-uncertain=sent or =unsent.'
+            )
+        # Recheck every saved payload before connecting, not halfway through sending.
+        self.validate()
+        if self.delivered():
+            return
+        try:
+            conn = smtp()
+        except Exception as exc:
+            raise RetryableSendError(
+                f'Failed to connect to the smtp server: {exc}'
+            ) from exc
+        try:
+            for index, message in enumerate(self.state.messages):
+                remaining = message.pending()
+                if not remaining:
+                    continue
+                data = self.message_bytes(index)
+                b4.logger.info(
+                    '  %s (%d pending recipients)', message.subject, len(remaining)
+                )
+                self.state.in_flight = index
+                self.save()
+                try:
+                    refused = conn.sendmail(self.state.fromaddr, remaining, data)
+                except (
+                    smtplib.SMTPSenderRefused,
+                    smtplib.SMTPRecipientsRefused,
+                ) as exc:
+                    self.state.in_flight = None
+                    self.save()
+                    raise RetryableSendError(
+                        f'SMTP rejected the message: {exc}'
+                    ) from exc
+                except smtplib.SMTPDataError as exc:
+                    if 400 <= exc.smtp_code < 600:
+                        self.state.in_flight = None
+                        self.save()
+                        raise RetryableSendError(f'SMTP rejected DATA: {exc}') from exc
+                    raise RuntimeError(f'SMTP rejected DATA: {exc}') from exc
+                except (OSError, smtplib.SMTPException) as exc:
+                    raise RuntimeError(
+                        f'SMTP outcome for <{message.message_id}> is uncertain: {exc}'
+                    ) from exc
+                if not set(refused) <= set(remaining):
+                    raise RuntimeError(
+                        'SMTP returned an unexpected recipient; outcome is uncertain'
+                    )
+                message.accepted.extend(
+                    addr for addr in remaining if addr not in refused
+                )
+                self.state.in_flight = None
+                self.save()
+                if refused:
+                    raise RetryableSendError(
+                        'SMTP refused recipients: ' + ', '.join(sorted(refused))
+                    )
+        finally:
+            conn.close()
+
+
+def pending_session(directory: Path) -> Optional[SendSession]:
+    pending = []
+    for path in sorted(directory.glob('v*/state.json')):
+        session = SendSession.load(path.parent)
+        if not session.state.finished:
+            pending.append(session)
+    if len(pending) > 1:
+        raise RuntimeError(f'Multiple unfinished submissions in {directory}')
+    return pending[0] if pending else None
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
new file mode 100644
index 0000000..823e74e
--- /dev/null
+++ b/src/tests/test_send_resume.py
@@ -0,0 +1,443 @@
+"""Interrupted submissions use frozen mail and never repeat accepted recipients.
+
+SMTP connections use mocks or a loopback-only server.
+"""
+
+import base64
+import dataclasses
+import email.policy
+import json
+import smtplib
+import socketserver
+import threading
+from email.message import EmailMessage
+from email.parser import BytesParser
+from pathlib import Path
+from typing import Any, Dict, List, Tuple, cast
+from unittest.mock import Mock
+
+import pytest
+
+import b4
+import patatt
+from b4._send import (
+    RetryableSendError,
+    SendSession,
+    State,
+)
+
+COVER = '20261113-an-intentionally-long-change-id-for-testing-wire-headers-v4-0-0123456789ab@example.org'
+
+
+class FakeSMTP:
+    def __init__(self, *outcomes: Any) -> None:
+        self.outcomes = list(outcomes)
+        self.calls: List[Tuple[str, List[str], bytes]] = []
+        self.closed = False
+
+    def sendmail(
+        self, sender: str, recipients: List[str], data: bytes
+    ) -> Dict[str, Tuple[int, bytes]]:
+        self.calls.append((sender, recipients[:], data))
+        result = self.outcomes.pop(0) if self.outcomes else {}
+        if isinstance(result, BaseException):
+            raise result
+        return cast(Dict[str, Tuple[int, bytes]], result)
+
+    def close(self) -> None:
+        self.closed = True
+
+    def connector(self) -> b4.SMTPConnector:
+        return b4.SMTPConnector(lambda: cast(smtplib.SMTP, self))
+
+
+def messages(count: int = 3) -> List[EmailMessage]:
+    result = []
+    for n in range(count):
+        msg = EmailMessage()
+        msg['From'] = 'Alice <alice@example.org>'
+        msg['To'] = 'Bob <bob@example.org>'
+        msg['Cc'] = 'List <list@example.org>'
+        msg['Subject'] = f'[PATCH v4 {n}/{count - 1}] message {n}'
+        msg['Message-ID'] = '<' + COVER.replace('-0-', f'-{n}-') + '>'
+        msg['Date'] = 'Fri, 13 Nov 2026 11:14:16 -0700'
+        if n:
+            msg['References'] = f'<{COVER}>'
+            msg['In-Reply-To'] = f'<{COVER}>'
+        msg.set_content(f'Message {n} with non-ASCII text: café.\n')
+        result.append(msg)
+    return result
+
+
+@pytest.fixture
+def session(tmp_path: Path) -> SendSession:
+    state = State(
+        change_id='test-change',
+        revision=4,
+        branch='b4/test',
+        head='a' * 40,
+        tree='b' * 40,
+        cover_hash='c' * 64,
+        tag_message='The cover letter',
+        cover_message_id=COVER,
+        fromaddr='alice@example.org',
+        messages=[],
+    )
+    return SendSession.prepare(
+        tmp_path / 'send' / 'series' / 'v4', state, b4.prepare_mail(messages())
+    )
+
+
+@pytest.mark.parametrize('code', [421, 450, 550])
+def test_explicit_rejection_resumes_without_duplicates(
+    session: SendSession, code: int
+) -> None:
+    first = FakeSMTP({}, smtplib.SMTPDataError(code, b'rejected'))
+    with pytest.raises(RetryableSendError, match='SMTP rejected DATA'):
+        session.send(first.connector())
+    assert first.closed
+    saved = SendSession.load(session.directory)
+    assert saved.state.in_flight is None
+    assert not saved.state.messages[0].pending()
+    assert saved.state.messages[1].pending()
+    second = FakeSMTP()
+    saved.send(second.connector())
+    assert len(first.calls) == len(second.calls) == 2
+    assert first.calls[1] == second.calls[0]
+    assert second.calls[1][2] == saved.message_bytes(2)
+    assert SendSession.load(session.directory).delivered()
+    unused = Mock(spec=b4.SMTPConnector)
+    saved.send(unused)
+    unused.assert_not_called()
+
+
+def test_partial_recipient_acceptance(session: SendSession) -> None:
+    first = FakeSMTP({'bob@example.org': (450, b'later')})
+    with pytest.raises(RetryableSendError, match='refused recipients'):
+        session.send(first.connector())
+    saved = SendSession.load(session.directory)
+    assert saved.state.messages[0].accepted == ['list@example.org']
+    second = FakeSMTP()
+    saved.send(second.connector())
+    assert second.calls[0][1] == ['bob@example.org']
+    assert second.calls[0][2] == first.calls[0][2]
+    assert second.calls[1][1] == ['bob@example.org', 'list@example.org']
+
+
+@pytest.mark.parametrize(
+    'error',
+    [
+        smtplib.SMTPRecipientsRefused({'bob@example.org': (550, b'no')}),
+        smtplib.SMTPSenderRefused(550, b'no', 'alice@example.org'),
+    ],
+)
+def test_envelope_rejection_is_safe_to_retry(
+    session: SendSession, error: Exception
+) -> None:
+    with pytest.raises(RetryableSendError, match='rejected'):
+        session.send(FakeSMTP(error).connector())
+    saved = SendSession.load(session.directory)
+    assert saved.state.in_flight is None
+    assert not any(message.accepted for message in saved.state.messages)
+
+
+@pytest.mark.parametrize(
+    'error',
+    [smtplib.SMTPServerDisconnected('lost'), TimeoutError('late'), KeyboardInterrupt()],
+)
+def test_uncertain_delivery_requires_reconciliation(
+    session: SendSession, error: BaseException
+) -> None:
+    with pytest.raises((RuntimeError, KeyboardInterrupt)) as exc:
+        session.send(FakeSMTP({}, error).connector())
+    assert not isinstance(exc.value, RetryableSendError)
+    saved = SendSession.load(session.directory)
+    assert saved.state.in_flight == 1
+    unused = Mock(spec=b4.SMTPConnector)
+    with pytest.raises(RuntimeError, match='uncertain'):
+        saved.send(unused)
+    unused.assert_not_called()
+
+
+@pytest.mark.parametrize('outcome,count', [('sent', 1), ('unsent', 2)])
+def test_reconcile_only_the_interrupted_transaction(
+    session: SendSession, outcome: str, count: int
+) -> None:
+    with pytest.raises(RuntimeError):
+        session.send(FakeSMTP({}, TimeoutError()).connector())
+    saved = SendSession.load(session.directory)
+    saved.resolve(outcome)
+    resumed = FakeSMTP()
+    SendSession.load(session.directory).send(resumed.connector())
+    assert len(resumed.calls) == count
+    assert resumed.calls[0][2] == saved.message_bytes(3 - count)
+    with pytest.raises(RuntimeError, match='no uncertain'):
+        saved.resolve(outcome)
+
+
+def test_connection_failure_does_not_create_uncertainty(session: SendSession) -> None:
+    connect = Mock(side_effect=OSError('offline'))
+    with pytest.raises(RetryableSendError, match='connect'):
+        session.send(b4.SMTPConnector(connect))
+    assert SendSession.load(session.directory).state.in_flight is None
+
+
+def test_acceptance_record_failure_blocks_retries(
+    session: SendSession, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    original = session.save
+    count = 0
+
+    def fail_after_acceptance() -> None:
+        nonlocal count
+        count += 1
+        if count == 2:
+            raise OSError('disk full')
+        original()
+
+    monkeypatch.setattr(session, 'save', fail_after_acceptance)
+    first = FakeSMTP()
+    with pytest.raises(OSError, match='disk full'):
+        session.send(first.connector())
+    assert len(first.calls) == 1
+    saved = SendSession.load(session.directory)
+    assert saved.state.in_flight == 0
+    unused = Mock(spec=b4.SMTPConnector)
+    with pytest.raises(RuntimeError, match='uncertain'):
+        saved.send(unused)
+    unused.assert_not_called()
+
+
+def test_attempt_record_failure_prevents_smtp_data(
+    session: SendSession, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    monkeypatch.setattr(session, 'save', Mock(side_effect=OSError('disk full')))
+    smtp = FakeSMTP()
+    with pytest.raises(OSError):
+        session.send(smtp.connector())
+    assert not smtp.calls
+    assert SendSession.load(session.directory).state.in_flight is None
+
+
+def test_changed_payload_is_rejected_before_connect(session: SendSession) -> None:
+    session.message_path(2).write_bytes(b'corrupt')
+    unused = Mock(spec=b4.SMTPConnector)
+    with pytest.raises(ValueError, match='changed'):
+        session.send(unused)
+    unused.assert_not_called()
+    with pytest.raises(RuntimeError, match='changed'):
+        SendSession.load(session.directory)
+
+
+@pytest.mark.parametrize(
+    'mutation',
+    [
+        {'schema': 2},
+        {'in_flight': 3},
+        {'in_flight': -1},
+        {'in_flight': True},
+        {'finished': True},
+        {'messages': []},
+        {'revision': '4'},
+    ],
+)
+def test_corrupt_snapshot_rejected(
+    session: SendSession, mutation: Dict[str, Any]
+) -> None:
+    path = session.directory / 'state.json'
+    state = json.loads(path.read_text())
+    state.update(mutation)
+    path.write_text(json.dumps(state))
+    with pytest.raises(RuntimeError):
+        SendSession.load(session.directory)
+
+
+def test_private_permissions_and_exact_wire_headers(session: SendSession) -> None:
+    assert session.directory.stat().st_mode & 0o077 == 0
+    for path in session.directory.iterdir():
+        assert path.stat().st_mode & 0o077 == 0
+    wire = session.message_bytes(1)
+    msg = BytesParser(policy=email.policy.compat32).parsebytes(wire)
+    for header in ('References', 'In-Reply-To'):
+        assert str(msg[header]).strip() == f'<{COVER}>'
+        assert '=?' not in str(msg[header])
+    assert b'\n' not in wire.replace(b'\r\n', b'')
+    with pytest.raises(RuntimeError, match='already recorded'):
+        SendSession.prepare(
+            session.directory,
+            dataclasses.replace(session.state, messages=[]),
+            b4.prepare_mail(messages()),
+        )
+
+
+def test_unknown_refusal_address_is_not_treated_as_success(
+    session: SendSession,
+) -> None:
+    with pytest.raises(RuntimeError, match='unexpected recipient'):
+        session.send(FakeSMTP({'foreign@example.org': (450, b'later')}).connector())
+    assert SendSession.load(session.directory).state.in_flight == 0
+
+
+def test_large_series_recovers_original_suffix(tmp_path: Path) -> None:
+    state = State(
+        'large', 4, 'b4/test', 'a', 'b', 'c', 'cover', COVER, 'alice@example.org', []
+    )
+    session = SendSession.prepare(
+        tmp_path / 'send' / 'large' / 'v4', state, b4.prepare_mail(messages(59))
+    )
+    first = FakeSMTP(*([{}] * 48), smtplib.SMTPDataError(421, b'later'))
+    with pytest.raises(RuntimeError):
+        session.send(first.connector())
+    second = FakeSMTP()
+    SendSession.load(session.directory).send(second.connector())
+    assert len(first.calls) == 49
+    assert len(second.calls) == 11
+    assert first.calls[48] == second.calls[0]
+    assert [call[2] for call in second.calls] == [
+        session.message_bytes(n) for n in range(48, 59)
+    ]
+
+
+@pytest.mark.parametrize('failure', ['data', 'recipient'])
+def test_real_smtplib_against_local_server(session: SendSession, failure: str) -> None:
+    """Exercise actual SMTP responses without delivering or relaying any mail."""
+    transactions: List[Tuple[List[str], bytes, bool]] = []
+    errors: List[BaseException] = []
+    refused_once = False
+
+    class Handler(socketserver.StreamRequestHandler):
+        def handle(self) -> None:
+            nonlocal refused_once
+            self.connection.settimeout(5)
+            accepted: List[str] = []
+            try:
+                self.wfile.write(b'220 localhost test-only SMTP\r\n')
+                while line := self.rfile.readline():
+                    command, _, rest = line.partition(b' ')
+                    command = command.strip().upper()
+                    if command in (b'EHLO', b'HELO'):
+                        self.wfile.write(b'250 localhost\r\n')
+                    elif command == b'MAIL':
+                        accepted = []
+                        self.wfile.write(b'250 sender ok\r\n')
+                    elif command == b'RCPT':
+                        address = (
+                            rest.decode().strip().split('<', 1)[1].split('>', 1)[0]
+                        )
+                        if (
+                            failure == 'recipient'
+                            and not refused_once
+                            and address == 'bob@example.org'
+                        ):
+                            refused_once = True
+                            self.wfile.write(b'450 try again later\r\n')
+                        else:
+                            accepted.append(address)
+                            self.wfile.write(b'250 recipient ok\r\n')
+                    elif command == b'DATA':
+                        self.wfile.write(b'354 send data\r\n')
+                        body = bytearray()
+                        while data := self.rfile.readline():
+                            if data == b'.\r\n':
+                                break
+                            body.extend(data[1:] if data.startswith(b'..') else data)
+                        rejected = failure == 'data' and len(transactions) == 1
+                        transactions.append((accepted[:], bytes(body), not rejected))
+                        if rejected:
+                            self.wfile.write(b'421 temporary problem\r\n')
+                            return
+                        self.wfile.write(b'250 accepted\r\n')
+                    elif command == b'RSET':
+                        accepted = []
+                        self.wfile.write(b'250 reset\r\n')
+                    else:
+                        raise AssertionError(
+                            f'Unexpected test-server command: {command!r}'
+                        )
+            except BaseException as exc:
+                errors.append(exc)
+                raise
+
+    with socketserver.TCPServer(('127.0.0.1', 0), Handler) as server:
+        worker = threading.Thread(
+            target=server.serve_forever, kwargs={'poll_interval': 0.01}
+        )
+        worker.start()
+        port = server.server_address[1]
+
+        def connector() -> b4.SMTPConnector:
+            return b4.SMTPConnector(lambda: smtplib.SMTP('127.0.0.1', port, timeout=5))
+
+        try:
+            with pytest.raises(RuntimeError, match='SMTP'):
+                session.send(connector())
+            saved = SendSession.load(session.directory)
+            saved.send(connector())
+        finally:
+            server.shutdown()
+            worker.join(timeout=5)
+        assert not worker.is_alive()
+    assert not errors
+    assert SendSession.load(session.directory).delivered()
+    delivered = [
+        (address, data)
+        for recipients, data, ok in transactions
+        if ok
+        for address in recipients
+    ]
+    expected = [
+        (address, session.message_bytes(index))
+        for index, message in enumerate(session.state.messages)
+        for address in message.recipients
+    ]
+    assert sorted(delivered) == sorted(expected)
+
+
+def test_changed_message_id_metadata_is_rejected(session: SendSession) -> None:
+    session.state.messages[1].message_id = 'other@example.org'
+    session.save()
+    with pytest.raises(RuntimeError, match='wire message'):
+        SendSession.load(session.directory)
+
+
+def test_resumed_signatures_verify_without_private_key(
+    session: SendSession, tmp_path: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    signing = pytest.importorskip('nacl.signing')
+    key = signing.SigningKey.generate()
+    private = tmp_path / 'private.key'
+    private.write_bytes(base64.b64encode(key.encode()))
+    public = tmp_path / 'keys' / 'ed25519' / 'example.org' / 'alice' / 'default'
+    public.parent.mkdir(parents=True)
+    public.write_bytes(base64.b64encode(key.verify_key.encode()))
+    monkeypatch.setattr(patatt, 'KEYCACHE', {})
+    monkeypatch.setattr(
+        patatt,
+        'get_main_config',
+        lambda: {
+            'identity': 'alice@example.org',
+            'selector': 'default',
+            'signingkey': f'ed25519:{private}',
+        },
+    )
+    saved = SendSession.prepare(
+        session.directory.parent / 'signed',
+        dataclasses.replace(session.state, messages=[]),
+        b4.prepare_mail(messages(), patatt_sign=True),
+    )
+    first = FakeSMTP({}, smtplib.SMTPDataError(421, b'later'))
+    with pytest.raises(RuntimeError):
+        saved.send(first.connector())
+    private.unlink()
+    monkeypatch.setattr(patatt, 'KEYCACHE', {})
+    monkeypatch.setattr(
+        patatt, 'rfc2822_sign', Mock(side_effect=AssertionError('must not resign'))
+    )
+    second = FakeSMTP()
+    SendSession.load(saved.directory).send(second.connector())
+    assert second.calls[0] == first.calls[1]
+    for _sender, _recipients, data in first.calls[:1] + second.calls:
+        assert b'X-Developer-Signature:' in data
+        results = patatt.validate_message(data, [str(tmp_path / 'keys')])
+        assert len(results) == 1
+        assert results[0][0] == patatt.RES_VALID

-- 
2.53.0

